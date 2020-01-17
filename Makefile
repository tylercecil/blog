C := ~/Downloads/pandoc-2.9.1.1/bin/pandoc
CFLAGS := --template=templates/post.html --mathjax

TARGET := docs
POSTSRC := $(shell find  posts -name "*.md")
POSTS:=$(patsubst %, $(TARGET)/%, $(POSTSRC:.md=.html))
TEMPLATES:=$(shell find templates -name "*.html")

.PHONEY: clean re serve

$(TARGET): $(TARGET)/css/ $(TARGET)/images/ $(TARGET)/index.html $(POSTS)

$(TARGET)/%: %
	@mkdir -p $$(dirname $@)
	rsync -r $< $@

$(TARGET)/posts/%.html: posts/%.md $(TEMPLATES)
	@mkdir -p $$(dirname $@)
	$(eval DATE := $(shell echo $< | ag -o '\d\d\d\d-\d\d-\d\d'))
	$(C) $(CFLAGS) -M date=$(DATE) -f markdown -t html $< -o $@

$(TARGET)/index.html: $(TARGET)/posts/all.yaml templates/index.html $(TEMPLATES)
	$(C) $(CFLAGS) -f markdown $< -t html -M title=Posts --template=templates/index.html -o $@

$(TARGET)/posts/all.yaml: $(POSTSRC)
	@mkdir -p $$(dirname $@)
	@echo "Making $@..."
	@touch $@
	@echo "---" > $@
	@echo "posts:" >> $@
	@for f in $^; do \
		echo "  Gathering metadata for $$f..."; \
		DATE=`echo $$f | ag -o '\d\d\d\d-\d\d-\d\d'`; \
		URL=`echo $$f | sed 's/.md/.html/g'`; \
		$(C) -M date=$$DATE -M url=$$URL --template=templates/post_record.yaml $$f >> $@; \
	done
	@echo "---" >> $@
	@echo "Done!"

serve: $(TARGET)
	cd $(TARGET) && python -m http.server 8000

re: clean $(TARGET)

clean:
	rm -rf $(TARGET)
