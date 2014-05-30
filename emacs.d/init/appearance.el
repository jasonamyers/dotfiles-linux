;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                 Apperance                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(menu-bar-mode 0) ; no menu bar

;;; Windowed config
(when (display-graphic-p)
    ;; Don't use messages that you don't read
    (setq initial-scratch-message "")
    (setq inhibit-startup-message t)

    ;; Other config options
    (blink-cursor-mode) ; No cursor blink
    (scroll-bar-mode 0) ; remove scrollbar
    (tool-bar-mode 0) ; no tool bar
)

(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-comidia)))
