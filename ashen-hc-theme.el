;;; ashen-hc-theme.el --- Ashen color theme, high-contrast version -*- lexical-binding: t; -*-

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

;;; Commentary:
;;
;; Ashen color theme for Neovim by Daniel Fichtinger a.k.a. ficd.
;; Ported to Emacs with a pure black foundational background by
;; Gustavo Arantes a.k.a. gnix.
;;
;; Add this directory to `custom-theme-load-path', then use
;; (load-theme 'ashen-hc t).

;;; Code:

(deftheme ashen-hc
  "Ashen's warm, muted colors on a pure black background.")

;; Names and values follow ashen.nvim's default palette.  Only the
;; foundational background changes; the highlight surfaces stay intact.
(let ((background     "#000000")
      (red-flame      "#C53030")
      (red-glowing    "#DF6464")
      (red-ember      "#B14242")
      (red-kindling   "#BD4C4C")
      (orange-glow    "#D87C4A")
      (orange-blaze   "#C4693D")
      (orange-smolder "#E49A44")
      (orange-golden  "#E5A72A")
      (blue           "#4A8B8B")
      (g-1            "#e5e5e5")
      (g-2            "#d5d5d5")
      (g-3            "#b4b4b4")
      (g-4            "#a7a7a7")
      (g-5            "#949494")
      (g-6            "#737373")
      (g-7            "#535353")
      (g-8            "#323232")
      (g-9            "#212121")
      (g-11           "#191919"))
  (custom-theme-set-faces
   'ashen-hc

   ;; Normal, Cursor, SignColumn, NonText, LineNr, CursorLineNr.
   `(default ((t (:foreground ,g-3 :background ,background
                  :weight normal :slant normal :underline nil))))
   `(cursor ((t (:background ,g-3))))
   `(fringe ((t (:foreground ,g-7 :background ,background))))
   `(border ((t (:foreground ,g-8 :background ,background))))
   `(internal-border ((t (:background ,background))))
   `(child-frame-border ((t (:background ,g-7))))
   `(line-number ((t (:foreground ,g-8 :background ,background))))
   `(line-number-current-line ((t (:foreground ,g-6 :background ,g-9))))
   `(shadow ((t (:foreground ,g-7))))
   `(minibuffer-prompt ((t (:foreground ,g-4 :weight normal))))
   `(window-divider ((t (:foreground ,g-8 :background ,g-9))))
   `(window-divider-first-pixel ((t (:foreground ,g-9))))
   `(window-divider-last-pixel ((t (:foreground ,g-9))))
   `(vertical-border ((t (:foreground ,g-8 :background ,g-9))))

   ;; Visual, VisualNOS, CursorLine, MatchParen, Folded.
   `(region ((t (:background ,g-8 :foreground unspecified :extend t))))
   `(secondary-selection ((t (:foreground ,red-ember :background ,g-8 :extend t))))
   `(highlight ((t (:background ,g-9 :foreground unspecified))))
   `(hl-line ((t (:background ,g-9 :extend t))))
   `(show-paren-match ((t (:background ,g-7 :foreground unspecified
                         :weight normal :underline nil))))
   `(show-paren-mismatch ((t (:foreground ,g-1 :background ,red-flame))))
   `(hs-ellipsis ((t (:foreground ,g-5 :background ,g-8 :box nil :height 1.0))))

   ;; CurSearch for the current match; Search for other matches.
   `(isearch ((t (:foreground ,background :background ,orange-glow :weight bold))))
   `(lazy-highlight ((t (:foreground ,background :background ,g-5 :weight bold))))
   `(match ((t (:foreground ,background :background ,g-5 :weight bold))))
   `(isearch-fail ((t (:foreground ,g-1 :background ,red-flame))))
   `(query-replace ((t (:inherit isearch))))

   ;; StatusLine and TabLine.  Inactive mode-line text is dimmed for Emacs.
   `(mode-line ((t (:foreground ,g-5 :background ,g-8 :box nil :weight normal))))
   `(mode-line-inactive ((t (:foreground ,g-6 :background ,g-8 :box nil))))
   `(mode-line-buffer-id ((t (:foreground ,g-5 :weight normal))))
   `(mode-line-highlight ((t (:background ,g-7 :box nil))))
   `(header-line ((t (:foreground ,g-5 :background ,g-8 :box nil))))
   `(tab-bar ((t (:foreground ,g-3 :background ,g-8))))
   `(tab-bar-tab ((t (:foreground ,g-2 :background ,background :box nil :weight normal))))
   `(tab-bar-tab-inactive ((t (:foreground ,g-3 :background ,g-8 :box nil))))
   `(tab-line ((t (:foreground ,g-3 :background ,g-8 :box nil))))
   `(tab-line-tab ((t (:foreground ,g-2 :background ,background :box nil))))
   `(tab-line-tab-current ((t (:inherit tab-line-tab))))
   `(tab-line-tab-inactive ((t (:foreground ,g-3 :background ,g-8 :box nil))))
   `(tab-line-highlight ((t (:background ,g-7))))

   ;; Syntax: Comment, String, Function, @keyword, Constant, Type,
   ;; @variable, @variable.member, @operator, and punctuation groups.
   `(font-lock-comment-face ((t (:foreground ,g-6 :slant normal))))
   `(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
   `(font-lock-doc-face ((t (:foreground ,red-glowing :slant normal))))
   `(font-lock-string-face ((t (:foreground ,red-glowing))))
   `(font-lock-function-name-face ((t (:foreground ,g-1 :weight normal))))
   `(font-lock-function-call-face ((t (:inherit font-lock-function-name-face))))
   `(font-lock-builtin-face ((t (:foreground ,g-1))))
   `(font-lock-keyword-face ((t (:foreground ,red-ember :weight normal))))
   `(font-lock-preprocessor-face ((t (:foreground ,red-ember))))
   `(font-lock-constant-face ((t (:foreground ,orange-blaze))))
   `(font-lock-type-face ((t (:foreground ,orange-blaze))))
   `(font-lock-variable-name-face ((t (:foreground ,g-3))))
   `(font-lock-variable-use-face ((t (:inherit font-lock-variable-name-face))))
   `(font-lock-property-name-face ((t (:foreground ,g-2))))
   `(font-lock-property-use-face ((t (:inherit font-lock-property-name-face))))
   `(font-lock-number-face ((t (:foreground ,blue))))
   `(font-lock-operator-face ((t (:foreground ,orange-glow))))
   `(font-lock-punctuation-face ((t (:foreground ,g-2))))
   `(font-lock-bracket-face ((t (:foreground ,g-6))))
   `(font-lock-delimiter-face ((t (:foreground ,orange-smolder))))
   `(font-lock-escape-face ((t (:foreground ,g-2))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,g-2 :weight normal))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,g-2 :weight normal))))
   `(font-lock-warning-face ((t (:foreground ,red-flame))))
   `(font-lock-negation-char-face ((t (:foreground ,orange-glow))))

   ;; DiagnosticError/Warn/Info/Hint and DiagnosticUnderline*.
   `(error ((t (:foreground ,red-flame :weight normal))))
   `(warning ((t (:foreground ,orange-golden :weight normal))))
   `(success ((t (:foreground ,g-2 :weight normal))))
   `(compilation-error ((t (:inherit error))))
   `(compilation-warning ((t (:inherit warning))))
   `(compilation-info ((t (:foreground ,g-2))))
   `(flymake-error
     ((((supports :underline (:style dots)))
       (:underline (:style dots :color ,red-flame)))
      (t (:underline (:style wave :color ,red-flame)))))
   `(flymake-warning
     ((((supports :underline (:style dots)))
       (:underline (:style dots :color ,orange-golden)))
      (t (:underline (:style wave :color ,orange-golden)))))
   `(flymake-note
     ((((supports :underline (:style dots)))
       (:underline (:style dots :color ,blue)))
      (t (:underline (:style wave :color ,blue)))))
   `(flycheck-error ((t (:inherit flymake-error))))
   `(flycheck-warning ((t (:inherit flymake-warning))))
   `(flycheck-info ((t (:inherit flymake-note))))
   `(flyspell-incorrect ((t (:underline (:style wave :color ,red-flame)))))
   `(flyspell-duplicate ((t (:underline (:style wave :color ,orange-golden)))))

   ;; Pmenu/PmenuSel and PmenuSbar/PmenuThumb; tooltips use NoicePopup.
   `(tooltip ((t (:foreground ,g-3 :background ,g-11))))
   `(completions-common-part ((t (:foreground ,g-1 :weight normal))))
   `(completions-first-difference ((t (:foreground ,red-ember :weight normal))))
   `(completions-annotations ((t (:foreground ,g-5 :slant normal))))
   `(completions-highlight ((t (:foreground ,g-1 :background ,g-7))))
   `(vertico-current ((t (:foreground ,g-1 :background ,g-7 :extend t))))
   `(corfu-default ((t (:foreground ,g-2 :background ,g-8))))
   `(corfu-current ((t (:foreground ,g-1 :background ,g-7))))
   `(corfu-border ((t (:background ,g-7))))
   `(corfu-bar ((t (:background ,g-7))))
   `(company-tooltip ((t (:foreground ,g-2 :background ,g-8))))
   `(company-tooltip-selection ((t (:foreground ,g-1 :background ,g-7))))
   `(company-tooltip-common ((t (:foreground ,g-1 :weight normal))))
   `(company-tooltip-common-selection ((t (:foreground ,g-1 :weight normal))))
   `(company-tooltip-annotation ((t (:foreground ,g-5))))
   `(company-tooltip-annotation-selection ((t (:foreground ,g-5))))
   `(company-scrollbar-bg ((t (:background ,g-8))))
   `(company-scrollbar-fg ((t (:background ,g-7))))
   `(company-preview ((t (:foreground ,g-7 :background ,background))))
   `(company-preview-common ((t (:foreground ,g-5 :background ,background))))
   `(company-preview-search ((t (:inherit match))))

   ;; Directory, @text.uri, @text.reference, and SpecialKey.
   `(dired-directory ((t (:foreground ,g-3 :weight normal))))
   `(dired-symlink ((t (:foreground ,g-3))))
   `(dired-marked ((t (:foreground ,red-ember :background ,g-8))))
   `(dired-flagged ((t (:foreground ,red-flame))))
   `(dired-header ((t (:foreground ,red-ember :weight bold))))
   `(dired-ignored ((t (:foreground ,g-7))))
   `(link ((t (:foreground ,g-2 :underline t))))
   `(link-visited ((t (:foreground ,red-kindling :underline t))))
   `(button ((t (:inherit link))))
   `(escape-glyph ((t (:foreground ,g-6))))
   `(homoglyph ((t (:foreground ,g-6))))
   `(nobreak-space ((t (:foreground ,g-6 :background ,background :underline nil))))
   `(trailing-whitespace ((t (:background ,red-flame))))

   ;; DiffAdd, DiffDelete, DiffChange, DiffText.  Added lines are gray,
   ;; not green: this follows Ashen's deliberate, restrained diff palette.
   `(diff-added ((t (:foreground ,g-4 :background ,g-8 :extend t))))
   `(diff-removed ((t (:foreground ,red-ember :background ,g-8 :extend t))))
   `(diff-changed ((t (:foreground ,orange-smolder :background ,g-6 :extend t))))
   `(diff-refine-added ((t (:foreground ,g-1 :background ,g-7))))
   `(diff-refine-removed ((t (:foreground ,g-1 :background ,g-7))))
   `(diff-refine-changed ((t (:foreground ,g-1 :background ,g-7))))
   `(diff-header ((t (:foreground ,g-3 :background ,g-8))))
   `(diff-file-header ((t (:foreground ,red-ember :background ,g-8 :weight bold))))
   `(diff-hunk-header ((t (:foreground ,g-5 :background ,g-9))))
   `(magit-diff-added ((t (:inherit diff-added))))
   `(magit-diff-added-highlight ((t (:inherit diff-added))))
   `(magit-diff-removed ((t (:inherit diff-removed))))
   `(magit-diff-removed-highlight ((t (:inherit diff-removed))))
   `(magit-diff-context ((t (:foreground ,g-3 :background ,background :extend t))))
   `(magit-diff-context-highlight ((t (:foreground ,g-3 :background ,g-9 :extend t))))
   `(magit-diff-hunk-heading ((t (:inherit diff-hunk-header))))
   `(magit-diff-hunk-heading-highlight ((t (:foreground ,g-2 :background ,g-7 :extend t))))
   `(magit-diff-file-heading ((t (:foreground ,red-ember :weight bold))))
   `(magit-diff-file-heading-highlight ((t (:foreground ,red-ember :background ,g-9 :weight bold :extend t))))
   `(magit-section-heading ((t (:foreground ,red-ember :weight bold))))
   `(magit-section-highlight ((t (:background ,g-9 :extend t))))
   `(magit-branch-local ((t (:foreground ,orange-blaze :weight normal))))
   `(magit-branch-remote ((t (:foreground ,blue :weight normal))))
   `(magit-hash ((t (:foreground ,g-5))))

   ;; @text.title, @text.literal, Todo, DiagnosticOk, and Folded.
   ;; Org has more document roles than Neovim's core highlight groups.
   `(org-document-title ((t (:foreground ,g-2 :weight normal :height 1.0))))
   `(org-document-info ((t (:foreground ,g-4))))
   `(org-level-1 ((t (:foreground ,g-2 :weight normal))))
   `(org-level-2 ((t (:inherit org-level-1))))
   `(org-level-3 ((t (:inherit org-level-1))))
   `(org-level-4 ((t (:inherit org-level-1))))
   `(org-level-5 ((t (:inherit org-level-1))))
   `(org-level-6 ((t (:inherit org-level-1))))
   `(org-level-7 ((t (:inherit org-level-1))))
   `(org-level-8 ((t (:inherit org-level-1))))
   `(org-code ((t (:foreground ,red-kindling))))
   `(org-verbatim ((t (:foreground ,red-kindling))))
   `(org-block ((t (:background ,background :extend t))))
   `(org-block-begin-line ((t (:foreground ,g-6 :background ,background :extend t))))
   `(org-block-end-line ((t (:inherit org-block-begin-line))))
   `(org-todo ((t (:foreground ,red-ember :background ,g-8 :weight normal))))
   `(org-done ((t (:foreground ,g-2 :weight normal))))
   `(org-link ((t (:inherit link))))
   `(org-date ((t (:foreground ,g-4 :underline t))))
   `(org-table ((t (:foreground ,g-4))))
   `(org-hide ((t (:foreground ,background))))
   `(org-ellipsis ((t (:foreground ,g-5 :background ,g-8 :underline nil))))

   ;; Ashen's ANSI palette intentionally maps green to orange.  Terminal
   ;; faces use matching foreground/background colors for ANSI escapes.
   `(term ((t (:foreground ,g-3 :background ,background))))
   `(term-color-black ((t (:foreground ,background :background ,background))))
   `(term-color-red ((t (:foreground ,red-ember :background ,red-ember))))
   `(term-color-green ((t (:foreground ,orange-glow :background ,orange-glow))))
   `(term-color-yellow ((t (:foreground ,orange-smolder :background ,orange-smolder))))
   `(term-color-blue ((t (:foreground ,blue :background ,blue))))
   `(term-color-magenta ((t (:foreground ,g-4 :background ,g-4))))
   `(term-color-cyan ((t (:foreground ,g-3 :background ,g-3))))
   `(term-color-white ((t (:foreground ,g-2 :background ,g-2))))
   `(ansi-color-black ((t (:foreground ,background :background ,background))))
   `(ansi-color-red ((t (:foreground ,red-ember :background ,red-ember))))
   `(ansi-color-green ((t (:foreground ,orange-glow :background ,orange-glow))))
   `(ansi-color-yellow ((t (:foreground ,orange-smolder :background ,orange-smolder))))
   `(ansi-color-blue ((t (:foreground ,blue :background ,blue))))
   `(ansi-color-magenta ((t (:foreground ,g-4 :background ,g-4))))
   `(ansi-color-cyan ((t (:foreground ,g-3 :background ,g-3))))
   `(ansi-color-white ((t (:foreground ,g-2 :background ,g-2))))
   `(ansi-color-bright-black ((t (:foreground ,g-5 :background ,g-5))))
   `(ansi-color-bright-red ((t (:inherit ansi-color-red))))
   `(ansi-color-bright-green ((t (:inherit ansi-color-green))))
   `(ansi-color-bright-yellow ((t (:inherit ansi-color-yellow))))
   `(ansi-color-bright-blue ((t (:inherit ansi-color-blue))))
   `(ansi-color-bright-magenta ((t (:inherit ansi-color-magenta))))
   `(ansi-color-bright-cyan ((t (:inherit ansi-color-cyan))))
   `(ansi-color-bright-white ((t (:inherit ansi-color-white)))))

  (custom-theme-set-variables
   'ashen-hc
   '(frame-background-mode 'dark)
   `(ansi-color-names-vector [,background ,red-ember ,orange-glow
                             ,orange-smolder ,blue ,g-4 ,g-3 ,g-2])))

;;;###autoload
(when load-file-name
  (add-to-list 'custom-theme-load-path
               (file-name-as-directory (file-name-directory load-file-name))))

(provide-theme 'ashen-hc)

;; Local Variables:
;; indent-tabs-mode: nil
;; End:

;;; ashen-hc-theme.el ends here.
