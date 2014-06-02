(require 'python)

;;; Define python repl type
(setq python-shell-interpreter "ipython")

;;; setup elpy with a rope backend
(require 'elpy)
(elpy-enable)

; tell elpy to use ipython
(elpy-use-ipython)
; make sure that the mode line isn't 20 miles long
(elpy-clean-modeline)


;;; Enable Abbreviations
(add-hook 'python-mode-hook
	  (lambda ()
	    (abbrev-mode 1)
	    )
	  )


;;; setup nose with and keyboard shortcuts
(require 'nose)
(require 'nose-mode)

(nose-mode-setup-keymap)
(add-hook 'python-mode-hook 'nose-mode-enable-if-test-module)
(setq nose-mode-test-module-regex ".+_tests?\\.py$")
(define-key nose-mode-map (kbd "C-c n f") 'nosetests-failed)
(define-key nose-mode-map (kbd "C-c n n") 'nosetests-again)
(define-key nose-mode-map (kbd "C-c n o") 'nosetests-one)
(define-key nose-mode-map (kbd "C-c n p o") 'nosetests-pdb-one)
