# Create a ClioPatria SWISH package from the SWISH distribution.

DIRS=lib/swish web/icons web/help
LIBS=lib/swish/storage.pl lib/swish/page.pl lib/swish/help.pl \
     lib/swish/examples.pl lib/swish/config.pl
JS=web/js/swish-min.js web/js/require.js
CSS=web/css/swish-min.css
ICONS=web/icons/owl_25_years.png \
      web/icons/dead.png web/icons/error.png web/icons/running.gif
HELP=$(addprefix web/help/, $(shell cd src/web/help && echo *.html))

all:	$(DIRS) $(LIBS) $(JS) $(CSS) $(ICONS) $(HELP)

lib/swish:
	mkdir -p $@
web/icons:
	mkdir -p $@
web/help:
	mkdir -p $@

lib/swish/%: src/lib/%
	rsync -u $< $@

web/js/swish-min.js: src/web/js/swish-min.js
	rsync -u $< $@
web/js/require.js: src/web/bower_components/requirejs/require.js
	rsync -u $< $@

web/css/swish-min.css: src/web/css/swish-min.css
	rsync -u $< $@

web/icons/%: src/web/icons/%
	rsync -u $< $@

web/help/%: src/web/help/%
	rsync -u $< $@
