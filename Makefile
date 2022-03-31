# Tyler Cecil's Blog
# ===============================================
#
# Requirements
#   - pandoc  (Tested with version 2.17)
#   - fd      (For collecting source files)
#   - rg      (Various text replacement)
#   - python3 (For webserver)
#   - inotify (For watching / auto-make)

# Pandoc Settings
C := pandoc
CFLAGS     := --mathjax --shift-heading-level-by=1 -f markdown -t html
CFLAGS     += --citeproc -M link-citations

# Input Files
POSTS_MD    := $(shell fd .md posts/  --exclude draft | sort -r)
POST_STAT_F := $(shell fd . posts/  --type file --exclude '*.md' --exclude '*.bib')
STATIC_F    := $(shell fd . static/ --type file)
COMMON_T    := $(shell fd . templates/common)
INDEX_T     := templates/index.html
ABOUT_T     := templates/about.html
SUB_T       := templates/subscribe.html
POST_T      := templates/post.html
ALL_P_T     := templates/post_record.yaml
FEED_T      := templates/atom.xml

# Output Files
SITE      := docs
STATIC    := $(patsubst static/%, $(SITE)/%, $(STATIC_F))
POSTS     := $(patsubst %, $(SITE)/%, $(POSTS_MD:.md=.html))
POST_STAT := $(patsubst %, $(SITE)/%, $(POST_STAT_F))
INDEX     := $(SITE)/index.html
ABOUT     := $(SITE)/about/index.html
SUB       := $(SITE)/subscribe/index.html
ALL_P     := $(SITE)/posts/all.yaml
FEED      := $(SITE)/feed/atom.xml

# Website Config
SITE_URL     := https://tylercecil.com
SITE_UPDATED := $(shell git --no-pager log -1 --date=short --pretty="format:%cd")

# Script Macros
RG_DATE := rg -o '(\d\d\d\d)/(\d\d)/(\d\d)' -r '$$1-$$2-$$3'

.PHONEY: clean serve watch

all: $(SITE)
$(SITE): $(ABOUT) $(FEED) $(INDEX) $(POSTS) $(POST_STAT) $(STATIC) $(SUB)

$(STATIC): $(SITE)/%: static/%
	@mkdir -p $$(dirname $@)
	cp $< $@

$(POST_STAT): $(SITE)/%: %
	@mkdir -p $$(dirname $@)
	cp $< $@

$(ABOUT): $(ABOUT_T) $(COMMON_T)
	@mkdir -p $$(dirname $@)
	$(C) $(CFLAGS) /dev/null --metadata title="about" --template=$< -o $@

$(SUB): $(SUB_T) $(COMMON_T)
	@mkdir -p $$(dirname $@)
	$(C) $(CFLAGS) /dev/null --metadata title="subscribe" --template=$< -o $@

$(POSTS): $(SITE)/posts/%.html: posts/%.md $(COMMON_T) $(POST_T)
	@mkdir -p $$(dirname $@)
	$(eval DIR    := $(shell dirname $<))
	$(eval DATE   := $(shell echo $< | $(RG_DATE)))
	$(C) $(CFLAGS) --resource-path=.:$(DIR) --template=$(POST_T) -M date=$(DATE) $< -o $@

$(INDEX): $(ALL_P) $(INDEX_T) $(COMMON_T)
	@mkdir -p $$(dirname $@)
	$(C) $(CFLAGS) $< --template=$(INDEX_T) -o $@

$(ALL_P): $(POSTS_MD) $(ALL_P_T)
	@mkdir -p $$(dirname $@)
	@echo "Making $@..."
	@echo "---" > $@
	@echo "title: Posts" >> $@
	@echo "posts:" >> $@
	@for f in $(POSTS_MD); do \
		echo "  Gathering metadata for $$f..."; \
		DATE=`echo $$f | $(RG_DATE)`; \
		URL=`echo $$f | sed 's/.md/.html/g'`; \
		$(C) --mathjax -M date=$$DATE -M url=$$URL --template=$(ALL_P_T) $$f >> $@; \
	done
	@echo "---" >> $@
	@echo "Done!"

$(FEED): $(ALL_P) $(FEED_T)
	@mkdir -p $$(dirname $@)
	$(C) $(CFLAGS) -M url=$(SITE_URL) -M updated=$(SITE_UPDATED) $< --template=$(FEED_T) -o $@

serve:
	@python3 -m http.server 8000 --directory $(SITE)

watch:
	@while true; do make; inotifywait -qre close_write ./; done

clean:
	rm -rf $(SITE)
