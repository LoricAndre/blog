.PHONY: all

ifndef VERBOSE
.SILENT:
endif

all: scripts/compile.sh
	scripts/compile.sh
	echo "All done !"

public/%.html: md/%.md style/main.css style/header.html style/nav.html
	echo "Compiling $@"
	cat style/nav.html > $@
	IN=$< OUT=$@ pandoc --default scripts/pandoc.yaml
	# pandoc -s style/nav.html $< \
	# 	-c style/main.css \
	# 	-t html \
	# 	--self-contained \
	# 	--include-in-header style/header.html \
	# 	>> $@
