URL := "anantshri.github.io/manual_verification"

.PHONY: all
all: build

.PHONY: ci
ci: check

# INSTALL ######################################################################

VENDOR_DIR := vendor
INSTALLED_FLAG := $(VENDOR_DIR)/.installed

.PHONY: install
install: $(INSTALLED_FLAG)
$(INSTALLED_FLAG): Gemfile* Makefile
	bundle install --path vendor
	@ touch $(INSTALLED_FLAG)  # indicate that dependencies are installed

.PHONY: update
update: install
	bundle update
	@ touch $(INSTALLED_FLAG)  # indicate that dependencies are installed

# BUILD ########################################################################

.PHONY: build
build: install
	sh gentemplate.sh > ./_data/templates.yml
	bundle exec jekyll build --quiet
	echo ${URL} > _site/CNAME

# CHECK ########################################################################

.PHONY: check
check: build
	echo "Checking Build"
	#bundle exec htmlproof _site --only-4xx

# RUN ##########################################################################

.PHONY: run
run: install
	bundle exec jekyll serve --future --drafts

.PHONY: launch
launch: install
	eval "sleep 5; open http://localhost:4000" & make run

# CLEAN ########################################################################

.PHONY: clean
clean:
	rm -rf _site

.PHONY: clean-all
clean-all: clean
	rm -rf .bundle $(VENDOR_DIR)