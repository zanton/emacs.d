all: lang_modes highlight_pkgs lisp/thing-edit.el auto_complete_pkgs lisp/magit lisp/helm

lisp:
	mkdir -p lisp

lang_modes: lisp lisp/markdown-mode.el lisp/cuda-mode.el lisp/google-c-style.el lisp/cmake-mode.el

lisp/google-c-style.el: lisp
	wget https://raw.githubusercontent.com/google/styleguide/gh-pages/google-c-style.el -O lisp/google-c-style.el

lisp/markdown-mode.el: lisp
	wget https://github.com/jrblevin/markdown-mode/archive/v2.3.tar.gz -O pkg.tar.gz
	mkdir -p pkg && tar xzvf pkg.tar.gz -C pkg
	cp pkg/*/$(notdir $@) lisp/
	rm -rf pkg.tar.gz pkg

lisp/cuda-mode.el: lisp
	wget https://github.com/chachi/cuda-mode/blob/master/cuda-mode.el -O $@

lisp/cmake-mode.el: lisp
	wget https://github.com/Kitware/CMake/blob/master/Auxiliary/cmake-mode.el -O $@

highlight_pkgs: lisp lisp/highlight-symbol.el lisp/breadcrumb.el lisp/symbol-overlay.el lisp/thing-edit.el

lisp/highlight-symbol.el: lisp
	wget https://github.com/nschum/highlight-symbol.el/blob/master/highlight-symbol.el -O $@

lisp/breadcrumb.el: lisp
	wget https://github.com/pheaver/breadcrumb/blob/master/breadcrumb.el -O $@

lisp/symbol-overlay.el: lisp
	wget https://github.com/wolray/symbol-overlay/blob/master/symbol-overlay.el -O $@

lisp/thing-edit.el: lisp
	wget https://github.com/emacsmirror/emacswiki.org/blob/master/thing-edit.el -O $@

auto_complete_pkgs: lisp/company-mode lisp/auto-complete

lisp/company-mode: lisp
	wget https://github.com/company-mode/company-mode/archive/0.9.10.tar.gz -O pkg.tar.gz
	mkdir -p pkg && tar xzvf pkg.tar.gz -C pkg
	mv pkg/company-mode-0.9.10 $@
	rm -rf pkg.tar.gz pkg

lisp/auto-complete: lisp
	wget https://github.com/auto-complete/auto-complete/archive/v1.5.1.tar.gz -O pkg.tar.gz
	mkdir -p pkg && tar xzvf pkg.tar.gz -C pkg
	mv pkg/auto-complete-1.5.1 $@
	rm -rf pkg.tar.gz pkg

lisp/magit: lisp lisp/dash lisp/with-editor lisp/ghub lisp/graphql lisp/treepy
	git submodule init $@

lisp/dash: lisp
	git submodule init $@

lisp/with-editor: lisp
	git submodule init $@

lisp/ghub: lisp
	git submodule init $@

lisp/graphql: lisp
	git submodule init $@

lisp/treepy: lisp
	git submodule init $@

lisp/helm: lisp lisp/async
	git submodule init $@

lisp/async: lisp
	git submodule init $@
