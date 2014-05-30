;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                 Imports                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq required-packages
  '(
    ;; General
    ido
    highlight
    highlight-parentheses
    tree-mode
    undo-tree
    windata
    xclip

    ;; Color themes
    color-theme

    ;; Python
    elpy
    pungi
    nose
    nose-mode

    ;; PHP
    php-mode
))

;;; ELPA packages
(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives
	'(
	  ("gnu" . "http://elpa.gnu.org/packages/")
	  ("marmalade" . "http://marmalade-repo.org/packages/")
	  ("melpa" . "http://melpa.milkbox.net/packages/")))
  (package-initialize)
  (unless package-archive-contents
    (package-refresh-contents))
  ;(mapcar 'install-if-not require-packages)

  ; install the missing packages
  (dolist (package required-packages)
    (unless (package-installed-p package)
      (package-install package)))
  ;(package-initialize)
)
