;; highlight-indent-guides: highlight indent columns
(require 'highlight-indent-guides)

(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

;; (setq highlight-indent-guides-method 'fill)
(setq highlight-indent-guides-method 'column)
;; (setq highlight-indent-guides-method 'character)
;; (setq highlight-indent-guides-character ?\|)

;; (setq highlight-indent-guides-auto-odd-face-perc 15)
;; (setq highlight-indent-guides-auto-even-face-perc 25)
;; (setq highlight-indent-guides-auto-character-face-perc 25)

(setq highlight-indent-guides-auto-enabled nil)
(set-face-background 'highlight-indent-guides-odd-face "black")
(set-face-background 'highlight-indent-guides-even-face "black")
(set-face-foreground 'highlight-indent-guides-character-face "dimgray")
