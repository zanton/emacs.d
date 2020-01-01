all: lang_modes highlight_pkgs lisp/thing-edit.el auto_complete_pkgs lisp/magit-2.90.1 lisp/helm

lisp:
	mkdir -p lisp

lang_modes: lisp lisp/markdown-mode.el lisp/cuda-mode.el lisp/google-c-style.el lisp/cmake-mode.el

lisp/google-c-style.el: lisp
	wget https://raw.githubusercontent.com/google/styleguide/gh-pages/google-c-style.el -O lisp/google-c-style.el

lisp/markdown-mode.el: lisp
	wget https://raw.githubusercontent.com/jrblevin/markdown-mode/master/markdown-mode.el -O $@

lisp/cuda-mode.el: lisp
	wget https://raw.githubusercontent.com/chachi/cuda-mode/master/cuda-mode.el -O $@

lisp/cmake-mode.el: lisp
	wget https://raw.githubusercontent.com/Kitware/CMake/master/Auxiliary/cmake-mode.el -O $@

highlight_pkgs: lisp lisp/highlight-symbol.el lisp/breadcrumb.el lisp/symbol-overlay.el lisp/thing-edit.el

lisp/highlight-symbol.el: lisp
	wget https://raw.githubusercontent.com/nschum/highlight-symbol.el/master/highlight-symbol.el -O $@

lisp/breadcrumb.el: lisp
	wget https://raw.githubusercontent.com/pheaver/breadcrumb/master/breadcrumb.el -O $@

lisp/symbol-overlay.el: lisp
	wget https://raw.githubusercontent.com/wolray/symbol-overlay/master/symbol-overlay.el -O $@

lisp/thing-edit.el: lisp
	wget https://raw.githubusercontent.com/emacsmirror/emacswiki.org/master/thing-edit.el -O $@

auto_complete_pkgs: lisp/company-mode lisp/auto-complete

lisp/company-mode: lisp
	git submodule init $@
	git submodule update $@

lisp/auto-complete: lisp lisp/popup.el
	git submodule init $@
	git submodule update $@

lisp/popup.el: lisp
	wget https://raw.githubusercontent.com/auto-complete/popup-el/master/popup.el -O $@

lisp/magit: lisp lisp/dash lisp/with-editor lisp/ghub lisp/graphql lisp/treepy lisp/libegit2 lisp/transient.el
	git submodule init $@
	git submodule update $@
	echo "LOAD_PATH  = -L $(PWD)/$@/lisp" > $@/config.mk
	echo "LOAD_PATH += -L $(PWD)/lisp" >> $@/config.mk
	echo "LOAD_PATH += -L $(PWD)/lisp/dash" >> $@/config.mk
	echo "LOAD_PATH += -L $(PWD)/lisp/with-editor" >> $@/config.mk
	echo "LOAD_PATH += -L $(PWD)/lisp/ghub" >> $@/config.mk
	echo "LOAD_PATH += -L $(PWD)/lisp/graphql" >> $@/config.mk
	echo "LOAD_PATH += -L $(PWD)/lisp/treepy" >> $@/config.mk
	echo "LOAD_PATH += -L $(PWD)/lisp/libegit2" >> $@/config.mk
	cd $@; make

lisp/magit-2.90.1: lisp lisp/dash lisp/with-editor lisp/ghub lisp/graphql lisp/treepy lisp/magit-popup.el
	wget https://github.com/magit/magit/releases/download/v2.90.1/magit-2.90.1.tar.gz
	tar xzvf magit-2.90.1.tar.gz
	cp -r magit-2.90.1 lisp/
	rm -rf magit-2.90.1.tar.gz magit-2.90.1
	echo "LOAD_PATH  = -L $(PWD)/$@/lisp" > $@/config.mk
	echo "LOAD_PATH += -L $(PWD)/lisp" >> $@/config.mk
	echo "LOAD_PATH += -L $(PWD)/lisp/dash" >> $@/config.mk
	echo "LOAD_PATH += -L $(PWD)/lisp/with-editor" >> $@/config.mk
	echo "LOAD_PATH += -L $(PWD)/lisp/ghub" >> $@/config.mk
	echo "LOAD_PATH += -L $(PWD)/lisp/graphql" >> $@/config.mk
	echo "LOAD_PATH += -L $(PWD)/lisp/treepy" >> $@/config.mk
	cd $@; make

lisp/dash: lisp
	git submodule init $@
	git submodule update $@

lisp/with-editor: lisp
	git submodule init $@
	git submodule update $@

lisp/ghub: lisp
	git submodule init $@
	git submodule update $@

lisp/graphql: lisp
	git submodule init $@
	git submodule update $@

lisp/treepy: lisp
	git submodule init $@
	git submodule update $@

lisp/libegit2: lisp
	git submodule init $@
	git submodule update $@
	cd $@; git submodule init
	cd $@; git submodule update
	mkdir -p $@/build
	cd $@/build; cmake ..; make

lisp/transient.el: lisp
	wget https://raw.githubusercontent.com/magit/transient/master/lisp/transient.el -O $@

lisp/magit-popup.el: lisp
	wget https://raw.githubusercontent.com/magit/magit-popup/master/magit-popup.el -O $@

lisp/helm: lisp lisp/async
	git submodule init $@
	git submodule update $@
	cd $@; EMACSLOADPATH="$(PWD)/lisp/async:" make

lisp/async: lisp
	git submodule init $@
	git submodule update $@
