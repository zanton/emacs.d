;; irony
(add-to-list 'load-path (concat user-emacs-dir "/lisp/irony-mode"))
(require 'irony)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'c++-mode-hook 'irony-mode)

;; company-irony
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;; flycheck-irony
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
