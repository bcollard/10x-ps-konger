SHELL := /bin/bash

THEME       := black
CSS         := theme/kong.css
DECK        := deck.md
DIST_DIR    := dist
PDF         := $(DIST_DIR)/klimax-presentation.pdf
SOURCES     := $(wildcard [0-9][0-9]-*.md)
CHROME      := /Applications/Google Chrome.app/Contents/MacOS/Google Chrome
REVEAL_MD   := node_modules/.bin/reveal-md

.PHONY: help install deck serve open static build pdf clean distclean

help: ## Show this help
	@grep -E '^[a-zA-Z_-]+:.*## ' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*## "}; {printf "  \033[36m%-10s\033[0m %s\n", $$1, $$2}'

install: ## Install npm dependencies (skips puppeteer's own Chromium download; PDF export uses system Chrome)
	PUPPETEER_SKIP_DOWNLOAD=true npm install

$(DECK): scripts/build-deck.sh $(SOURCES) ## (internal) regenerate deck.md from the numbered source files
	./scripts/build-deck.sh

deck: $(DECK) ## Regenerate deck.md from the numbered NN-*.md source files

serve: deck ## Serve the deck locally with live reload (watches deck.md)
	$(REVEAL_MD) $(DECK) --theme $(THEME) --css $(CSS) -w

open: serve ## Alias for serve

static: build ## Alias for build

build: deck ## Export a static, self-contained HTML site to dist/
	$(REVEAL_MD) $(DECK) --theme $(THEME) --css $(CSS) --static $(DIST_DIR)

pdf: deck ## Export the deck to a PDF in dist/ (uses system Google Chrome)
	mkdir -p $(DIST_DIR)
	$(REVEAL_MD) $(DECK) --theme $(THEME) --css $(CSS) --print $(PDF) --puppeteer-chromium-executable "$(CHROME)"

clean: ## Remove generated deck.md and dist/
	rm -f $(DECK)
	rm -rf $(DIST_DIR)

distclean: clean ## Also remove node_modules
	rm -rf node_modules
