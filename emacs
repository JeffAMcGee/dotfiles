(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

;(add-to-list 'load-path "/Users/jeff/.emacs.d/color-theme-6.6.0")
;(require 'color-theme)
;(eval-after-load "color-theme"
;  '(progn
;     (color-theme-initialize)
;     (color-theme-hober)))

;(add-to-list 'load-path "/Users/jeff/.emacs.d/ice")
;(require 'icicles)

(add-to-list 'load-path "/Users/jeff/.emacs.d/scripts")
(require 'color-theme-zenburn)
(color-theme-zenburn)
