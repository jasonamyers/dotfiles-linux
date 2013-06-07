;;; pyflakes.el --- run the python pyflakes checker putting hits in a grep buffer

;; Copyright (C) 2011 Darius Powell

;; Author: Darius Powell <dariusp686@gmail.com>
;; Version: 1.0
;; URL: http://bitbucket.org/dariusp686/emacs-pyflakes
;; Keywords: python, pyflakes, check, lint

;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Code:

(defvar pyflakes-hist nil)

(defgroup pyflakes nil
  "Run pyflakes putting hits in a grep buffer."
  :group 'tools
  :group 'processes)

(defcustom pyflakes-cmd "pyflakes"
  "The pyflakes command."
  :type 'string
  :group 'pyflakes)

;;;###autoload
(defun pyflakes ()
  (interactive)
  (let* ((cmd (read-shell-command "Command: " (concat pyflakes-cmd " " (file-name-nondirectory (or (buffer-file-name) ""))) 'pyflakes-hist))
         (null-device nil))
    (grep cmd)))

(provide 'pyflakes)

;;; pyflakes.el ends here
