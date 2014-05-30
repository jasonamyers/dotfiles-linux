;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;                                 Bindings                                   ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;; Windowing
(global-set-key (kbd "C-1") 'delete-other-windows)
(global-set-key (kbd "C-2") 'split-window-below)
(global-set-key (kbd "C-3") 'split-window-right)
(global-set-key (kbd "C-0") 'delete-window)

;;; Movement/editing
(global-set-key (kbd "C-w") 'unix-werase-or-kill)
(global-set-key (kbd "C-x r i") 'string-insert-rectangle)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-d") 'delete-word)
(global-set-key (kbd "M-n") 'move-to-center-column)
(global-set-key (kbd "M-s M-s") 'replace-regexp)

;;; Modes
(global-unset-key (kbd "C-x m")) ; unset 'compose-mail
(global-set-key (kbd "C-x m e") 'emacs-lisp-mode)
(global-set-key (kbd "C-x m f") 'flymake-mode)
(global-set-key (kbd "C-x m h") 'haskell-mode)
(global-set-key (kbd "C-x m i") 'jira-mode)
(global-set-key (kbd "C-x m l") 'linum-mode)
(global-set-key (kbd "C-x m o") 'org-mode)
(global-set-key (kbd "C-x m p") 'python-mode)
(global-set-key (kbd "C-x m s") 'shell-script-mode)
(global-set-key (kbd "C-x m t") 'text-mode)
(global-set-key (kbd "C-x m w") 'whitespace-mode)
