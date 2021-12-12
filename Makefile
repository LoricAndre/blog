.PHONY: all

ifndef VERBOSE
.SILENT:
endif

all: scripts/compile.sh public/blog.html public/posts/list.html
	scripts/compile.sh ./md
	scripts/compile.sh ./md/posts
	echo "All done !"

public/posts/list.html: scripts/build_blog_list.sh
	scripts/build_blog_list.sh

public/blog.html: md/blog.md public/posts/list.html scripts/pandoc.yaml style/main.css
	echo "Compiling blog home page..."
	IN=md/blog.md OUT=$@ pandoc -d scripts/pandoc.yaml --include-after-body=public/posts/list.html

public/%.html: md/posts/%.md scripts/pandoc.yaml style/main.css
	echo "Compiling $@"
	IN=$< OUT=$@ pandoc -d scripts/pandoc.yaml

public/%.html: md/%.md scripts/pandoc.yaml style/main.css
	echo "Compiling $@"
	IN=$< OUT=$@ pandoc -d scripts/pandoc.yaml

install: all
	echo "Installing compiled html to $(INSTALL_PATH) as $(INSTALL_USER)."
	sudo -u $(INSTALL_USER) cp public/*.html $(INSTALL_PATH)
