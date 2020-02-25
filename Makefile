# Build Configuration
C          := pandoc
CFLAGS     := --mathjax --shift-heading-level-by=1 -f markdown -t html
CFLAGS     += --filter pandoc-citeproc -M link-citations
GET_UPDATE := git --no-pager log -1 --date=short --pretty="format:%cd"

# Input Files
MD       := $(shell find posts -path posts/draft -prune -o -name "*.md" -print | sort -r)
T_PARTS  := templates/header.html templates/footer.html templates/navbar.html
T_PLIST  := templates/index.html
T_ABOUT  := templates/about.html
T_SUB    := templates/subscribe.html
T_POST   := templates/post.html
T_ALL_P  := templates/post_record.yaml
T_FEED   := templates/atom.xml
STATDIRS := css/ images/
STATFS   := $(shell find $(STATDIRS) -type f)

# Output Files
SITE   := docs
STATIC := $(patsubst %, $(SITE)/%, $(STATFS))
POSTS  := $(patsubst %, $(SITE)/%, $(MD:.md=.html))
PLIST  := $(SITE)/index.html
ABOUT  := $(SITE)/about/index.html
SUB    := $(SITE)/subscribe/index.html
ALL_P  := $(SITE)/posts/all.yaml
FEED   := $(SITE)/feed/atom.xml

# Website Variables
SITE_URL     := https://tylercecil.com
SITE_UPDATED := $(shell $(GET_UPDATE))

.PHONEY: clean serve watch

all: $(SITE)
$(SITE): $(STATIC) $(ABOUT) $(SUB) $(POSTS) $(PLIST) $(FEED)

$(STATIC): $(SITE)/%: %
	@mkdir -p $$(dirname $@)
	cp $< $@

$(ABOUT): $(T_ABOUT) $(T_PARTS)
	@mkdir -p $$(dirname $@)
	$(C) $(CFLAGS) /dev/null --template=$< -o $@

$(SUB): $(T_SUB) $(T_PARTS)
	@mkdir -p $$(dirname $@)
	$(C) $(CFLAGS) /dev/null --template=$< -o $@

$(POSTS): $(SITE)/posts/%.html: posts/%.md $(T_PARTS) $(T_POST)
	@mkdir -p $$(dirname $@)
	$(eval DATE   := $(shell echo $< | ag -o '\d\d\d\d-\d\d-\d\d'))
	$(C) $(CFLAGS) --template=$(T_POST) -M date=$(DATE) $< -o $@

$(PLIST): $(ALL_P) $(T_PLIST) $(T_PARTS)
	@mkdir -p $$(dirname $@)
	$(C) $(CFLAGS) $< --template=$(T_PLIST) -o $@

$(ALL_P): $(MD) $(T_ALL_P)
	@mkdir -p $$(dirname $@)
	@echo "Making $@..."
	@echo "---" > $@
	@echo "title: Posts" >> $@
	@echo "posts:" >> $@
	@for f in $(MD); do \
		echo "  Gathering metadata for $$f..."; \
		DATE=`echo $$f | ag -o '\d\d\d\d-\d\d-\d\d'`; \
		URL=`echo $$f | sed 's/.md/.html/g'`; \
		$(C) --mathjax -M date=$$DATE -M url=$$URL --template=$(T_ALL_P) $$f >> $@; \
	done
	@echo "---" >> $@
	@echo "Done!"

$(FEED): $(ALL_P) $(T_FEED)
	@mkdir -p $$(dirname $@)
	$(C) $(CFLAGS) -M url=$(SITE_URL) -M updated=$(SITE_UPDATED) $< --template=$(T_FEED) -o $@

serve:
	python -m http.server 8000 --directory $(SITE)

watch:
	while true; do make; inotifywait -qre close_write ./; done

clean:
	rm -rf $(SITE)
