.PHONY: all

ifndef VERBOSE
.SILENT:
endif

all: scripts/compile.sh
	scripts/compile.sh
	echo "All done !"

public/%.html: md/%.md
	echo "Compiling $@"
	IN=$< OUT=$@ pandoc -d scripts/pandoc.yaml

install: all
	echo "Installing compiled html to $(INSTALL_PATH) as $(INSTALL_USER)."
	sudo -u $(INSTALL_USER) cp public/*.html $(INSTALL_PATH)
