;; GUI options: no menu bar, no tool bar
(custom-set-variables
 '(column-number-mode t)
 '(menu-bar-mode nil)
 '(scroll-bar-mode (quote right))
 '(tool-bar-mode nil))

;; Show line number
;(global-linum-mode t)
(setq linum-format "%3d ")

;; Set default font size
(set-default-font "Ubuntu Mono 11")

;; Themes
;; Set theme to dark laptop
;; Use another theme when emacs is run on terminal
;; because dark-laptop doesn't look dark when run on terminal
;;(add-to-list 'custom-theme-load-path (concat user-emacs-dir "/themes"))
;;(load-theme 'dark-laptop) ;; Emacs in own window
;;(load-theme 'wombat)      ;; Emacs in tty

;; Initial window size when Emacs is opened
(when window-system (set-frame-size (selected-frame) 90 60))

;; Making buffer names unique by uniquify
(require 'uniquify)
(setq uniquify-buffer-name-style 'reverse)
