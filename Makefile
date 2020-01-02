magit_ver=2.90.1

all: lisp lang_modes highlight_pkgs thing-edit auto_complete_pkgs magit-$(magit_ver) helm

lisp:
	mkdir -p lisp

lang_modes: google-c-style markdown-mode cuda-mode cmake-mode

google-c-style: lisp/google-c-style.el
markdown-mode: lisp/markdown-mode.el
cuda-mode: lisp/cuda-mode.el
cmake-mode: lisp/cmake-mode.el

highlight_pkgs: highlight-symbol breadcrumb symbol-overlay

highlight-symbol: lisp/highlight-symbol.el
breadcrumb: lisp/breadcrumb.el
symbol-overlay: lisp/symbol-overlay.el

thing-edit: lisp/thing-edit.el

lisp/google-c-style.el:
	wget https://raw.githubusercontent.com/google/styleguide/gh-pages/google-c-style.el -O lisp/google-c-style.el

lisp/markdown-mode.el:
	wget https://raw.githubusercontent.com/jrblevin/markdown-mode/master/markdown-mode.el -O $@

lisp/cuda-mode.el:
	wget https://raw.githubusercontent.com/chachi/cuda-mode/master/cuda-mode.el -O $@

lisp/cmake-mode.el:
	wget https://raw.githubusercontent.com/Kitware/CMake/master/Auxiliary/cmake-mode.el -O $@

lisp/highlight-symbol.el:
	wget https://raw.githubusercontent.com/nschum/highlight-symbol.el/master/highlight-symbol.el -O $@

lisp/breadcrumb.el:
	wget https://raw.githubusercontent.com/pheaver/breadcrumb/master/breadcrumb.el -O $@

lisp/symbol-overlay.el:
	wget https://raw.githubusercontent.com/wolray/symbol-overlay/master/symbol-overlay.el -O $@

lisp/thing-edit.el:
	wget https://raw.githubusercontent.com/emacsmirror/emacswiki.org/master/thing-edit.el -O $@

auto_complete_pkgs: company-mode auto-complete

company-mode: lisp/company-mode/company.el
auto-complete: lisp/auto-complete/auto-complete.el popup
popup: lisp/popup.el

lisp/company-mode/company.el:
	git submodule update --init $(dir $@)

lisp/auto-complete/auto-complete.el:
	git submodule update --init $(dir $@)

lisp/popup.el:
	wget https://raw.githubusercontent.com/auto-complete/popup-el/master/popup.el -O $@

magit: dash with-editor ghub graphql treepy libegit2 transient lisp/magit/lisp/magit.el

lisp/magit/lisp/magit.el:
	git submodule update --init lisp/magit
	echo "LOAD_PATH  = -L $(PWD)/lisp/magit/lisp" > lisp/magit/config.mk
	echo "LOAD_PATH += -L $(PWD)/lisp" >> lisp/magit/config.mk
	echo "LOAD_PATH += -L $(PWD)/lisp/dash" >> lisp/magit/config.mk
	echo "LOAD_PATH += -L $(PWD)/lisp/with-editor" >> lisp/magit/config.mk
	echo "LOAD_PATH += -L $(PWD)/lisp/ghub" >> lisp/magit/config.mk
	echo "LOAD_PATH += -L $(PWD)/lisp/graphql" >> lisp/magit/config.mk
	echo "LOAD_PATH += -L $(PWD)/lisp/treepy" >> lisp/magit/config.mk
	echo "LOAD_PATH += -L $(PWD)/lisp/libegit2" >> lisp/magit/config.mk
	cd lisp/magit; make

magit-$(magit_ver): dash with-editor ghub graphql treepy magit-popup lisp/magit-$(magit_ver)/lisp/magit.el

lisp/magit-$(magit_ver)/lisp/magit.el:
	wget https://github.com/magit/magit/releases/download/v$(magit_ver)/magit-$(magit_ver).tar.gz
	tar xzvf magit-$(magit_ver).tar.gz
	cp -r magit-$(magit_ver) lisp/
	rm -rf magit-$(magit_ver).tar.gz magit-$(magit_ver)
	echo "LOAD_PATH  = -L $(PWD)/lisp/magit-$(magit_ver)/lisp" > lisp/magit-$(magit_ver)/config.mk
	echo "LOAD_PATH += -L $(PWD)/lisp" >> lisp/magit-$(magit_ver)/config.mk
	echo "LOAD_PATH += -L $(PWD)/lisp/dash" >> lisp/magit-$(magit_ver)/config.mk
	echo "LOAD_PATH += -L $(PWD)/lisp/with-editor" >> lisp/magit-$(magit_ver)/config.mk
	echo "LOAD_PATH += -L $(PWD)/lisp/ghub" >> lisp/magit-$(magit_ver)/config.mk
	echo "LOAD_PATH += -L $(PWD)/lisp/graphql" >> lisp/magit-$(magit_ver)/config.mk
	echo "LOAD_PATH += -L $(PWD)/lisp/treepy" >> lisp/magit-$(magit_ver)/config.mk
	cd lisp/magit-$(magit_ver); make

dash: lisp/dash/dash.el
with-editor: lisp/with-editor/with-editor.el
ghub: lisp/ghub/ghub.el
graphql: lisp/graphql/graphql.el
treepy: lisp/treepy/treepy.el
libegit2: lisp/libegit2/libgit.el
transient: lisp/transient.el
magit-popup: lisp/magit-popup.el

lisp/dash/dash.el:
	git submodule update --init $(dir $@)

lisp/with-editor/with-editor.el:
	git submodule update --init $(dir $@)

lisp/ghub/ghub.el:
	git submodule update --init $(dir $@)

lisp/graphql/graphql.el:
	git submodule update --init $(dir $@)

lisp/treepy/treepy.el:
	git submodule update --init $(dir $@)

lisp/libegit2/libgit.el:
	git submodule update --init $(dir $@)
	cd $(dir $@); git submodule update --init
	mkdir -p $(dir $@)/build
	cd $(dir $@)/build; cmake ..; make

lisp/transient.el:
	wget https://raw.githubusercontent.com/magit/transient/master/lisp/transient.el -O $@

lisp/magit-popup.el:
	wget https://raw.githubusercontent.com/magit/magit-popup/master/magit-popup.el -O $@

helm: async lisp/helm/helm.el

lisp/helm/helm.el:
	git submodule update --init $(dir $@)
	cd $(dir $@); EMACSLOADPATH="$(PWD)/lisp/async:" make

async: lisp/async/async.el

lisp/async/async.el:
	git submodule update --init $(dir $@)
