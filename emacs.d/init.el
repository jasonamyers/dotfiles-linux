;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                               Local functions                              ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun install-if-not (pkg)
  "Install the package if it's not initialized"
  (unless (require pkg) (package-install pkg)))

(defun mkdir-if-not (dir)
  "Make directory if it doesn't exist"
  (unless (file-exists-p dir) (mkdir dir)))

(defun load-if-exists (file)
  "Load file if it exists"
  (when (file-exists-p file) (load-file file)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                  Init files                                ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; General
(load-if-exists "~/.emacs.d/init/elpa-installs.el")
(load-if-exists "~/.emacs.d/init/movement.el")
(load-if-exists "~/.emacs.d/init/formatting.el")
(load-if-exists "~/.emacs.d/init/global-modes.el")
(load-if-exists "~/.emacs.d/init/bindings.el")
(load-if-exists "~/.emacs.d/init/appearance.el")
(load-if-exists "~/.emacs.d/init/rainbow-delimiters.el")
(load-if-exists "~/.emacs.d/init/org-mode.el")

;;; Language specific
(load-if-exists "~/.emacs.d/init/python.el")
(load-if-exists "~/.emacs.d/init/web-mode.el")
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                   Config                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Configure backups
(mkdir-if-not "~/.emacs.d/backups")
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))
(setq backup-by-copying t)

;;; General config
(setq linum-format "%s ")                                 ; add space after line numbers
(fset 'yes-or-no-p 'y-or-n-p)                             ; All 'yes/no' prompts show 'y/n'
(set-display-table-slot standard-display-table 'wrap ?\ ) ; remove linewrap '\'
(put 'downcase-region 'disabled nil)

;;; Flymake config
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow")))))

;;; Hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;(add-hook 'write-file-hooks (lambda () (untabify (point-min) (point-max)))) ; untabify buffer


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                 Actions                                    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;(unless (and (fboundp 'server-running-p) (server-running-p))
;  (server-start))
(put 'upcase-region 'disabled nil)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("75c9f0b0499ecdd0c856939a5de052742d85af81814e84faa666522c2bba7e85" default))))
