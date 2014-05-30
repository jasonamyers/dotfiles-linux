;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               Global modes                                 ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  Definition  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; global-highlight-parentheses-mode
(when (require 'highlight-parentheses)
  (define-globalized-minor-mode global-highlight-parentheses-mode
    highlight-parentheses-mode
    (lambda () (highlight-parentheses-mode t)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   Enabling   ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(column-number-mode t)			; (line, column)

(when (require 'undo-tree) (global-undo-tree-mode 1))
(when (require 'ido) (ido-mode t))
(when (require 'highlight-parentheses)
  (global-highlight-parentheses-mode t)))
