C := ~/Downloads/pandoc-2.9.1.1/bin/pandoc
CFLAGS := --template=templates/post.html --mathjax

TARGET := docs
POSTSRC := $(shell find  posts -name "*.md")
POSTS:=$(patsubst %, $(TARGET)/%, $(POSTSRC:.md=.html))
TEMPLATES:=$(shell find templates -name "*.html")

.PHONEY: clean re serve

$(TARGET): $(TARGET)/css/ $(TARGET)/images/ $(POSTS)

$(TARGET)/%: %
	@mkdir -p $$(dirname $@)
	rsync -r $< $@

$(TARGET)/posts/%.html: posts/%.md $(TEMPLATES)
	@mkdir -p $$(dirname $@)
	$(eval DATE := $(shell echo $< | ag -o '\d\d\d\d-\d\d-\d\d'))
	$(C) $(CFLAGS) -M date=$(DATE) -f markdown -t html $< -o $@

$(TARGET)/posts/all.yaml: $(POSTSRC)
	@echo "Making $@..."
	@touch $@
	@echo "posts=[" > $@
	@for f in $^; do \
		echo "  Gathering metadata for $$f..."; \
		$(C) --template=templates/debug.html $$f >> $@; \
		echo ", " >> $@; \
	done
	@echo "]" >> $@
	@echo "Done!"

serve: $(TARGET)
	cd $(TARGET) && python -m http.server 8000

re: clean $(TARGET)

clean:
	rm -rf $(TARGET)
