;; Popwin: display temporary windows better
(require 'popwin)
(popwin-mode 1)

;; Quickrun with popwin
(push '("*quickrun*") popwin:special-display-config)
(defun quickrun-shell-fixed ()
  (interactive)
  (quickrun-shell)
  (sit-for 0.5)
  (beginning-of-buffer)
  (sit-for 0.5)
  (end-of-buffer))
(global-set-key (kbd "C-c r") 'quickrun-shell-fixed)
