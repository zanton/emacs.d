;;
;; flycheck
;; ref: http://www.flycheck.org/en/latest/languages.html#syntax-checker-c/c++-gcc
;;
(add-to-list 'load-path (concat user-emacs-dir "/lisp/flycheck"))
(require 'flycheck)
(add-hook 'c-mode-hook 'flycheck-mode)
(add-hook 'c++-mode-hook 'flycheck-mode)
(add-hook 'latex-mode-hook 'flycheck-mode)
(add-hook 'python-mode-hook 'flycheck-mode)

(flycheck-define-checker c/c++
                         "A C/C++ checker using g++."
                         :command ("g++" "-Wall" "-Wextra" source)
                         :error-patterns ((error line-start
                                                 (file-name) ":" line ":" column ":" " Error: " (message)
                                                 line-end)
                                          (warning line-start
                                                   (file-name) ":" line ":" column ":" " Warning: " (message)
                                                   line-end))
                         :modes (c-mode c++-mode))
