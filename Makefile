# Build Configuration
C          := pandoc
CFLAGS     := --mathjax --shift-heading-level-by=1 -f markdown -t html
GET_UPDATE := git --no-pager log -1 --date=short --pretty="format:%cd"

# Input Files
MD       := $(shell find  posts -name "*.md" | sort -r)
T_PARTS  := templates/header.html templates/footer.html templates/navbar.html
T_PLIST  := templates/index.html
T_POST   := templates/post.html
T_ALL_P  := templates/post_record.yaml
T_FEED   := templates/atom.xml

# Output Files
SITE   := docs
POSTS  := $(patsubst %, $(SITE)/%, $(MD:.md=.html))
STATIC := $(SITE)/css/ $(SITE)/images/
PLIST  := $(SITE)/index.html
ALL_P  := $(SITE)/posts/all.yaml
FEED   := $(SITE)/feed/atom.xml

# Website Variables
SITE_URL     := https://tylercecil.com
SITE_UPDATED := $(shell $(GET_UPDATE))

.PHONEY: clean serve
all: $(SITE)
$(SITE): $(STATIC) $(PLIST) $(POSTS) $(FEED)

$(SITE)/%: %
	@mkdir -p $$(dirname $@)
	rsync -r --del $< $@

$(SITE)/posts/%.html: posts/%.md $(T_PARTS) $(T_POST)
	@mkdir -p $$(dirname $@)
	$(eval DATE   := $(shell echo $< | ag -o '\d\d\d\d-\d\d-\d\d'))
	$(eval UPDATE := $(shell $(GET_UPDATE) $<))
	$(C) $(CFLAGS) --template=$(T_POST) -M date=$(DATE) -M update=$(UPDATE) $< -o $@

$(PLIST): $(ALL_P) $(T_PLIST) $(T_PARTS)
	@mkdir -p $$(dirname $@)
	$(C) $(CFLAGS) $< --template=$(T_PLIST) -o $@

$(ALL_P): $(MD) $(T_ALL_P)
	@mkdir -p $$(dirname $@)
	@echo "Making $@..."
	@echo "---" > $@
	@echo "title: All Posts" >> $@
	@echo "posts:" >> $@
	@for f in $(MD); do \
		echo "  Gathering metadata for $$f..."; \
		DATE=`echo $$f | ag -o '\d\d\d\d-\d\d-\d\d'`; \
		UPDATE=`$(GET_UPDATE) $$f`; \
		URL=`echo $$f | sed 's/.md/.html/g'`; \
		$(C) --mathjax -M date=$$DATE -M update=$$UPDATE -M url=$$URL --template=$(T_ALL_P) $$f >> $@; \
	done
	@echo "---" >> $@
	@echo "Done!"

$(FEED): $(ALL_P) $(T_FEED)
	@mkdir -p $$(dirname $@)
	$(C) $(CFLAGS) -M url=$(SITE_URL) -M updated=$(SITE_UPDATED) $< --template=$(T_FEED) -o $@

serve:
	python -m http.server 8000 --directory $(SITE)

clean:
	rm -rf $(SITE)
