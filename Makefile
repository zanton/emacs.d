.DEFAULT_GOAL := all

magit_ver=2.90.1
wget_opts=--no-check-certificate

## Language modes
lang_modes  = # nothing yet
lang_modes += google-c-style
lang_modes += markdown-mode
lang_modes += cuda-mode
lang_modes += cmake-mode
lang_modes += lua-mode

google-c-style: lisp/google-c-style.el
lisp/google-c-style.el:
	wget https://raw.githubusercontent.com/google/styleguide/gh-pages/google-c-style.el $(wget_opts) -O $@

markdown-mode: lisp/markdown-mode.el
lisp/markdown-mode.el:
	wget https://raw.githubusercontent.com/jrblevin/markdown-mode/master/markdown-mode.el $(wget_opts) -O $@

cuda-mode: lisp/cuda-mode.el
lisp/cuda-mode.el:
	wget https://raw.githubusercontent.com/chachi/cuda-mode/master/cuda-mode.el $(wget_opts) -O $@

cmake-mode: lisp/cmake-mode.el
lisp/cmake-mode.el:
	wget https://raw.githubusercontent.com/Kitware/CMake/master/Auxiliary/cmake-mode.el $(wget_opts) -O $@

lua-mode: lisp/lua-mode.el
lisp/lua-mode.el:
	wget https://raw.githubusercontent.com/immerrr/lua-mode/master/lua-mode.el $(wget_opts) -O $@

## Packages
lisp_dir = lisp
$(lisp_dir):
	mkdir -p $@

## Highlight
highlight_pkgs  = # nothing yet
highlight_pkgs += highlight-symbol
highlight_pkgs += breadcrumb
highlight_pkgs += symbol-overlay
highlight_pkgs += highlight-indent-guides
highlight_pkgs += auto-highlight-symbol
highlight_pkgs += volatile-highlights
highlight_pkgs += bm

highlight-symbol: lisp/highlight-symbol.el
lisp/highlight-symbol.el:
	wget https://raw.githubusercontent.com/nschum/highlight-symbol.el/master/highlight-symbol.el $(wget_opts) -O $@

breadcrumb: lisp/breadcrumb.el
lisp/breadcrumb.el:
	wget https://raw.githubusercontent.com/pheaver/breadcrumb/master/breadcrumb.el $(wget_opts) -O $@

symbol-overlay: lisp/symbol-overlay.el
lisp/symbol-overlay.el:
	wget https://raw.githubusercontent.com/wolray/symbol-overlay/master/symbol-overlay.el $(wget_opts) -O $@

highlight-indent-guides: lisp/highlight-indent-guides.el
lisp/highlight-indent-guides.el:
	wget https://raw.githubusercontent.com/DarthFennec/highlight-indent-guides/master/highlight-indent-guides.el $(wget_opts) -O $@

auto-highlight-symbol: lisp/auto-highlight-symbol.el
lisp/auto-highlight-symbol.el:
	wget https://raw.githubusercontent.com/mhayashi1120/auto-highlight-symbol-mode/master/auto-highlight-symbol.el $(wget_opts) -O $@
	wget https://raw.githubusercontent.com/mhayashi1120/auto-highlight-symbol-mode/master/auto-highlight-symbol-config.el $(wget_opts) -c -P $(dir $@)

volatile-highlights: lisp/volatile-highlights.el
lisp/volatile-highlights.el:
	wget https://raw.githubusercontent.com/k-talo/volatile-highlights.el/master/volatile-highlights.el $(wget_opts) -O $@

bm: lisp/bm/bm.el
lisp/bm/bm.el:
	git submodule update --init $(dir $@)

## Completion
completion_pkgs  = # nothing yet
completion_pkgs += company-mode
completion_pkgs += auto-complete

company-mode: lisp/company-mode/company.el
lisp/company-mode/company.el:
	git submodule update --init $(dir $@)

auto-complete: lisp/auto-complete/auto-complete.el popup
lisp/auto-complete/auto-complete.el:
	git submodule update --init $(dir $@)

popup: lisp/popup.el
lisp/popup.el:
	wget https://raw.githubusercontent.com/auto-complete/popup-el/master/popup.el $(wget_opts) -O $@

## Magit
magit  = # nothing yet
magit += dash
magit += with-editor
magit += ghub
magit += graphql
magit += treepy
### for repository instance
# magit += libegit2
# magit += transient
# magit += lisp/magit/lisp/magit.el
### for package instance
magit += magit-popup
magit += lisp/magit-$(magit_ver)/lisp/magit.el

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
lisp/dash/dash.el:
	git submodule update --init $(dir $@)

with-editor: lisp/with-editor/with-editor.el
lisp/with-editor/with-editor.el:
	git submodule update --init $(dir $@)

ghub: lisp/ghub/ghub.el
lisp/ghub/ghub.el:
	git submodule update --init $(dir $@)

graphql: lisp/graphql/graphql.el
lisp/graphql/graphql.el:
	git submodule update --init $(dir $@)

treepy: lisp/treepy/treepy.el
lisp/treepy/treepy.el:
	git submodule update --init $(dir $@)

libegit2: lisp/libegit2/libgit.el
lisp/libegit2/libgit.el:
	git submodule update --init $(dir $@)
	cd $(dir $@); git submodule update --init
	mkdir -p $(dir $@)/build
	cd $(dir $@)/build; cmake ..; make

transient: lisp/transient.el
lisp/transient.el:
	wget https://raw.githubusercontent.com/magit/transient/master/lisp/transient.el $(wget_opts) -O $@

magit-popup: lisp/magit-popup.el
lisp/magit-popup.el:
	wget https://raw.githubusercontent.com/magit/magit-popup/master/magit-popup.el $(wget_opts) -O $@

## Helm
helm  = # nothing yet
helm += async
helm += lisp/helm/helm.el
helm += helm-swoop
helm += helm-gtags

async: lisp/async/async.el
lisp/async/async.el:
	git submodule update --init $(dir $@)

lisp/helm/helm.el:
	git submodule update --init $(dir $@)
	cd $(dir $@); EMACSLOADPATH="$(PWD)/lisp/async:" make

helm-swoop: lisp/helm-swoop.el
lisp/helm-swoop.el:
	wget https://raw.githubusercontent.com/emacsorphanage/helm-swoop/master/helm-swoop.el $(wget_opts) -O $@

helm-gtags: lisp/helm-gtags.el
lisp/helm-gtags.el:
	wget https://raw.githubusercontent.com/syohex/emacs-helm-gtags/master/helm-gtags.el $(wget_opts) -O $@

## Utility pkgs
utility_pkgs += # nothing yet
utility_pkgs += thing-edit
utility_pkgs += quickrun
utility_pkgs += popwin
utility_pkgs += flycheck
utility_pkgs += undo-tree
utility_pkgs += irony
utility_pkgs += company-irony
utility_pkgs += flycheck-irony

thing-edit: lisp/thing-edit.el
lisp/thing-edit.el:
	wget https://raw.githubusercontent.com/emacsmirror/emacswiki.org/master/thing-edit.el $(wget_opts) -O $@

quickrun: lisp/quickrun.el
lisp/quickrun.el:
	wget https://raw.githubusercontent.com/syohex/emacs-quickrun/master/quickrun.el $(wget_opts) -O $@

popwin: lisp/popwin.el
lisp/popwin.el:
	wget https://raw.githubusercontent.com/m2ym/popwin-el/master/popwin.el $(wget_opts) -O $@

flycheck: lisp/flycheck/flycheck.el
lisp/flycheck/flycheck.el:
	git submodule update --init $(dir $@)

undo-tree: lisp/undo-tree.el
lisp/undo-tree.el:
	wget http://www.dr-qubit.org/undo-tree/undo-tree.el $(wget_opts) -O $@

irony: lisp/irony-mode/irony.el
lisp/irony-mode/irony.el:
	git submodule update --init $(dir $@)

company-irony: lisp/company-irony.el
lisp/company-irony.el:
	wget https://raw.githubusercontent.com/Sarcasm/company-irony/master/company-irony.el $(wget_opts) -O $@

flycheck-irony: lisp/flycheck-irony.el
lisp/flycheck-irony.el:
	wget https://raw.githubusercontent.com/Sarcasm/flycheck-irony/master/flycheck-irony.el $(wget_opts) -O $@

## all
all: $(lisp_dir) $(lang_modes) $(highlight_pkgs) $(completion_pkgs) $(magit) $(helm) $(utility_pkgs)
