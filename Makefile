.PHONY: all

ifndef VERBOSE
.SILENT:
endif

all: scripts/compile.sh
	scripts/compile.sh
	echo "All done !"

public/%.html: md/%.md style/main.css style/header.html style/nav.html
	echo "Compiling $@"
	IN=$< OUT=$@ pandoc -d scripts/pandoc.yaml

install: all
	echo "Installing compiled html to $(PATH) and giving ownership to $(USER)."
	cp public/*.html $(PATH)
	chown -R $(USER) $(PATH)
