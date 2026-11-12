;;; ashen-minimal-hc-theme.el --- Restrained Ashen on pure black -*- lexical-binding: t; -*-

;; Copyright (C) 2026 Gustavo Arantes a.k.a. gnix
;; Copyright (C) Daniel Fichtinger

;; Author: Gustavo Arantes a.k.a. gnix
;; URL: https://github.com/gnix0/ashen-hc-theme
;; Version: 0.1.0
;; Package-Requires: ((emacs "27.1"))
;; Keywords: faces, theme

;; Permission is hereby granted, free of charge, to any person
;; obtaining a copy of this software and associated documentation
;; files (the "Software"), to deal in the Software without
;; restriction, including without limitation the rights to use, copy,
;; modify, merge, publish, distribute, sublicense, and/or sell copies
;; of the Software, and to permit persons to whom the Software is
;; furnished to do so, subject to the following conditions:
;;
;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.
;;
;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
;; MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS
;; BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
;; ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
;; CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
;; SOFTWARE.

;;; Code:

(require 'ashen-minimal-theme-common
         (expand-file-name "ashen-minimal-theme-common"
                           (file-name-directory
                            (or load-file-name
                                (bound-and-true-p byte-compile-current-file)
                                buffer-file-name))))

(deftheme ashen-minimal-hc
  "Restrained Ashen on pure black.")

(ashen-theme-define 'ashen-minimal-hc t)

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-directory load-file-name)))

(provide-theme 'ashen-minimal-hc)
