;;; ashen-minimal-theme-common.el --- Shared Ashen theme definitions -*- lexical-binding: t; -*-

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

(require 'cl-lib)

(defvar treesit-font-lock-settings)
(defvar treesit-font-lock-feature-list)
(declare-function treesit-font-lock-rules "treesit" (&rest query-specs))
(declare-function treesit-font-lock-recompute-features "treesit" (&optional add-list remove-list language))
(declare-function treesit-node-start "treesit" (node))
(declare-function treesit-node-end "treesit" (node))
(declare-function treesit-fontify-with-override "treesit" (start end face override &optional bound-start bound-end))

(defun ashen-theme-define (theme black)
  "Define THEME with shared syntax and BLACK foundational surfaces."
  (let ((background     (if black "#000000" "#121212"))
        (fringe-background (if black "#000000" "#212121"))
        (gutter-background (if black "#000000" "#191919"))
        (block-background (if black "#000000" "#191919"))
        (menu-background (if black "#000000" "#1d1d1d"))
      (red-flame      "#C53030")
      (red-glowing    "#DF6464")
      (red-ember      "#B14242")
      (orange-glow    "#D87C4A")
      (orange-blaze   "#C4693D")
      (orange-smolder "#E49A44")
      (orange-golden  "#E5A72A")
      (brown          "#89492A")
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
      (g-10           "#1d1d1d")
      (g-11           "#191919")
      (g-12           "#151515")
      (foreground     "#ffffff"))
  (custom-theme-set-faces
   theme

   `(default ((t (:foreground ,foreground :background ,background
                  :weight normal :slant normal :underline nil))))
   `(cursor ((t (:background ,g-5))))
   `(fringe ((t (:foreground ,g-7 :background ,fringe-background))))
   `(border ((t (:foreground ,g-8 :background ,background))))
   `(internal-border ((t (:background ,background))))
   `(child-frame-border ((t (:background ,g-7))))
   `(line-number ((t (:foreground ,g-3 :background ,gutter-background))))
   `(line-number-current-line ((t (:foreground ,foreground :background ,g-8))))
   `(shadow ((t (:foreground ,g-7))))
   `(minibuffer-prompt ((t (:foreground ,red-ember :weight bold))))
   `(window-divider ((t (:foreground ,g-7 :background ,background))))
   `(window-divider-first-pixel ((t (:foreground ,background))))
   `(window-divider-last-pixel ((t (:foreground ,background))))
   `(vertical-border ((t (:foreground ,g-7 :background ,background))))

   `(region ((t (:background ,g-8))))
   `(secondary-selection ((t (:background ,g-11 :foreground ,g-3))))
   `(highlight ((t (:background ,g-11))))
   `(hl-line ((t (:inherit highlight :extend t))))
   `(show-paren-match ((t (:background ,g-6 :foreground ,g-12))))
   `(show-paren-mismatch ((t (:background ,red-flame :foreground ,g-12))))
   `(hs-ellipsis ((t (:foreground ,g-5 :background ,g-8 :box nil :height 1.0))))

   `(isearch ((t (:foreground ,orange-blaze :background ,g-11 :inverse-video t))))
   `(lazy-highlight ((t (:foreground ,orange-smolder :background ,g-11 :inverse-video t))))
   `(match ((t (:inherit lazy-highlight))))
   `(isearch-fail ((t (:foreground ,g-1 :background ,red-flame))))
   `(query-replace ((t (:inherit isearch))))

   `(mode-line ((t (:foreground ,foreground :background ,g-9))))
   `(mode-line-inactive ((t (:foreground ,g-3 :background ,g-9))))
   `(mode-line-buffer-id ((t (:foreground ,g-3 :weight normal))))
   `(mode-line-highlight ((t (:background ,g-7 :box nil))))
   `(header-line ((t (:background ,g-9 :foreground ,g-5))))
   `(tab-bar ((t (:foreground ,g-3 :background ,g-8))))
   `(tab-bar-tab ((t (:foreground ,g-2 :background ,background :box nil :weight normal))))
   `(tab-bar-tab-inactive ((t (:foreground ,g-3 :background ,g-8 :box nil))))
   `(tab-line ((t (:foreground ,g-3 :background ,g-8 :box nil))))
   `(tab-line-tab ((t (:foreground ,g-2 :background ,background :box nil))))
   `(tab-line-tab-current ((t (:inherit tab-line-tab))))
   `(tab-line-tab-inactive ((t (:foreground ,g-3 :background ,g-8 :box nil))))
   `(tab-line-highlight ((t (:background ,g-7))))
   `(font-lock-comment-face ((t (:foreground ,g-6 :slant normal))))
   `(font-lock-comment-delimiter-face ((t (:inherit font-lock-comment-face))))
   `(font-lock-doc-face ((t (:inherit font-lock-comment-face))))
   `(font-lock-doc-markup-face ((t (:inherit font-lock-comment-face))))
   `(font-lock-string-face ((t (:foreground ,red-glowing :weight normal :slant normal))))
   `(font-lock-function-name-face ((t (:foreground ,foreground :weight normal :slant normal))))
   `(font-lock-function-call-face ((t (:foreground ,foreground :weight normal :slant normal))))
   `(font-lock-builtin-face ((t (:foreground ,foreground :weight normal :slant normal))))
   `(font-lock-keyword-face ((t (:foreground ,orange-glow :weight bold :slant normal))))
   `(font-lock-preprocessor-face ((t (:foreground ,g-5 :weight normal :slant normal))))
   `(font-lock-constant-face ((t (:foreground ,foreground :weight normal :slant normal))))
   `(font-lock-type-face ((t (:foreground ,g-5 :weight normal :slant normal))))
   `(font-lock-variable-name-face ((t (:foreground ,foreground :weight normal :slant normal))))
   `(font-lock-variable-use-face ((t (:foreground ,foreground :weight normal :slant normal))))
   `(font-lock-property-name-face ((t (:foreground ,foreground :weight normal :slant normal))))
   `(font-lock-property-use-face ((t (:foreground ,foreground :weight normal :slant normal))))
   `(font-lock-number-face ((t (:foreground ,foreground :weight normal :slant normal))))
   `(font-lock-operator-face ((t (:foreground ,foreground :weight normal :slant normal))))
   `(font-lock-punctuation-face ((t (:foreground ,foreground :weight normal :slant normal))))
   `(font-lock-misc-punctuation-face ((t (:foreground ,foreground :weight normal :slant normal))))
   `(font-lock-bracket-face ((t (:foreground ,foreground :weight normal :slant normal))))
   `(font-lock-delimiter-face ((t (:foreground ,foreground :weight normal :slant normal))))
   `(font-lock-escape-face ((t (:inherit font-lock-string-face))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,foreground :weight normal :slant normal))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,foreground :weight normal :slant normal))))
   `(font-lock-warning-face ((t (:foreground ,orange-golden :weight bold))))
   `(font-lock-negation-char-face ((t (:foreground ,foreground :weight normal :slant normal))))

   `(error ((t (:foreground ,red-flame :weight bold))))
   `(warning ((t (:foreground ,orange-golden :weight bold))))
   `(success ((t (:foreground ,orange-blaze :weight bold))))
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
       (:underline (:style dots :color ,g-5)))
      (t (:underline (:style wave :color ,g-5)))))
   `(flycheck-error ((t (:inherit flymake-error))))
   `(flycheck-warning ((t (:inherit flymake-warning))))
   `(flycheck-info ((t (:inherit flymake-note))))
   `(flyspell-incorrect ((t (:underline (:style wave :color ,red-flame)))))
   `(flyspell-duplicate ((t (:underline (:style wave :color ,orange-golden)))))

   `(eglot-inlay-hint-face ((t (:foreground ,g-6 :height 0.8 :slant italic))))
   `(eglot-type-hint-face ((t (:inherit eglot-inlay-hint-face))))
   `(eglot-parameter-hint-face ((t (:inherit eglot-inlay-hint-face))))

   `(tooltip ((t (:background ,g-9 :foreground ,foreground :box (:line-width 1 :color ,g-6)))))
   `(completions-common-part ((t (:foreground ,g-6))))
   `(completions-first-difference ((t (:foreground ,foreground :weight bold))))
   `(completions-annotations ((t (:foreground ,g-5 :slant italic))))
   `(completions-group-title ((t (:foreground ,orange-glow :weight bold))))
   `(completions-highlight ((t (:foreground "#000000" :background ,g-4 :inverse-video nil))))
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

   `(dired-directory ((t (:foreground ,orange-glow))))
   `(dired-symlink ((t (:foreground ,red-ember))))
   `(dired-marked ((t (:foreground ,red-ember :background ,g-8))))
   `(dired-flagged ((t (:foreground ,red-flame))))
   `(dired-header ((t (:foreground ,red-ember :weight bold))))
   `(dired-ignored ((t (:foreground ,g-5))))
   `(link ((t (:foreground ,blue :underline t))))
   `(link-visited ((t (:foreground ,red-ember :underline t))))
   `(button ((t (:background ,g-8 :foreground ,foreground :box (:line-width 2 :color ,g-7)))))
   `(widget-button ((t (:inherit button))))
   `(widget-field ((t (:foreground ,foreground :background ,g-9 :extend t))))
   `(menu ((t (:foreground ,foreground :background ,menu-background :inverse-video nil))))
   `(tty-menu-enabled-face ((t (:foreground ,foreground :background ,menu-background :weight normal))))
   `(tty-menu-disabled-face ((t (:foreground ,g-7 :background ,menu-background))))
   `(scroll-bar ((t (:foreground ,g-7 :background ,g-10))))

   `(tty-menu-selected-face ((t (:foreground "#000000" :background ,g-4 :inverse-video nil))))
   `(escape-glyph ((t (:foreground ,g-6))))
   `(homoglyph ((t (:foreground ,g-6))))
   `(nobreak-space ((t (:foreground ,g-6 :background ,background :underline nil))))
   `(trailing-whitespace ((t (:background ,red-flame))))

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

   `(org-document-title ((t (:inherit org-level-1 :height 1.0))))
   `(org-document-info ((t (:foreground ,g-4))))
   `(org-level-1 ((t (:foreground ,orange-glow :weight bold))))
   `(org-level-2 ((t (:foreground ,orange-blaze))))
   `(org-level-3 ((t (:foreground ,orange-glow))))
   `(org-level-4 ((t (:inherit org-level-2))))
   `(org-level-5 ((t (:inherit org-level-3))))
   `(org-level-6 ((t (:inherit org-level-2))))
   `(org-level-7 ((t (:inherit org-level-3))))
   `(org-level-8 ((t (:inherit org-level-2))))
   `(org-code ((t (:foreground ,orange-blaze))))
   `(org-verbatim ((t (:inherit org-code))))
   `(org-block ((t (:background ,block-background :extend t))))
   `(org-block-begin-line ((t (:foreground ,g-6 :background ,block-background :extend t))))
   `(org-block-end-line ((t (:inherit org-block-begin-line))))
   `(org-todo ((t (:foreground ,red-ember :background ,g-8 :weight normal))))
   `(org-done ((t (:foreground ,g-2 :weight normal))))
   `(org-link ((t (:inherit link))))
   `(org-date ((t (:foreground ,g-4 :underline t))))
   `(org-table ((t (:foreground ,g-4))))
   `(org-hide ((t (:foreground ,background))))
   `(org-ellipsis ((t (:foreground ,g-5 :background ,g-8 :underline nil))))

   `(tree-sitter-hl-face:attribute ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:comment ((t (:inherit font-lock-comment-face))))
   `(tree-sitter-hl-face:comment.block.documentation ((t (:inherit font-lock-comment-face))))
   `(tree-sitter-hl-face:comment.unused ((t (:inherit font-lock-comment-face))))
   `(tree-sitter-hl-face:conceal ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:constructor ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:constant ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:constant.builtin ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:constant.builtin.boolean ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:constant.character ((t (:inherit font-lock-string-face))))
   `(tree-sitter-hl-face:constant.character.escape ((t (:inherit font-lock-string-face))))
   `(tree-sitter-hl-face:constant.macro ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:constant.numeric ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:diff.delta ((t (:foreground ,brown))))
   `(tree-sitter-hl-face:diff.minus ((t (:foreground ,red-ember))))
   `(tree-sitter-hl-face:diff.plus ((t (:foreground ,g-6))))
   `(tree-sitter-hl-face:error ((t (:foreground ,red-flame))))
   `(tree-sitter-hl-face:function ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:function.builtin ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:function.call ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:function.macro ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:hint ((t (:foreground ,g-4))))
   `(tree-sitter-hl-face:info ((t (:foreground ,g-2))))
   `(tree-sitter-hl-face:keyword ((t (:inherit font-lock-keyword-face))))
   `(tree-sitter-hl-face:keyword.conditional ((t (:inherit font-lock-keyword-face))))
   `(tree-sitter-hl-face:keyword.control.conditional ((t (:inherit font-lock-keyword-face))))
   `(tree-sitter-hl-face:keyword.control.directive ((t (:inherit font-lock-keyword-face))))
   `(tree-sitter-hl-face:keyword.control.import ((t (:inherit font-lock-keyword-face))))
   `(tree-sitter-hl-face:keyword.directive ((t (:inherit font-lock-keyword-face))))
   `(tree-sitter-hl-face:keyword.operator ((t (:inherit font-lock-keyword-face))))
   `(tree-sitter-hl-face:keyword.storage ((t (:inherit font-lock-keyword-face))))
   `(tree-sitter-hl-face:keyword.storage.modifier ((t (:inherit font-lock-keyword-face))))
   `(tree-sitter-hl-face:keyword.storage.modifier.mut ((t (:inherit font-lock-keyword-face))))
   `(tree-sitter-hl-face:keyword.storage.modifier.ref ((t (:inherit font-lock-keyword-face))))
   `(tree-sitter-hl-face:label ((t (:inherit font-lock-keyword-face))))
   `(tree-sitter-hl-face:markup.bold ((t (:weight bold))))
   `(tree-sitter-hl-face:markup.heading ((t (:foreground ,red-glowing :weight bold))))
   `(tree-sitter-hl-face:markup.italic ((t (:slant italic))))
   `(tree-sitter-hl-face:markup.link.label ((t (:foreground ,red-ember))))
   `(tree-sitter-hl-face:markup.link.text ((t (:foreground ,red-glowing))))
   `(tree-sitter-hl-face:markup.link.uri ((t (:foreground ,red-glowing :slant italic :underline t))))
   `(tree-sitter-hl-face:markup.link.url ((t (:foreground ,red-glowing :slant italic :underline t))))
   `(tree-sitter-hl-face:markup.list ((t (:foreground ,orange-glow))))
   `(tree-sitter-hl-face:markup.list.checked ((t (:foreground ,orange-glow))))
   `(tree-sitter-hl-face:markup.list.numbered ((t (:foreground ,orange-glow))))
   `(tree-sitter-hl-face:markup.list.unchecked ((t (:foreground ,orange-glow))))
   `(tree-sitter-hl-face:markup.list.unnumbered ((t (:foreground ,orange-glow))))
   `(tree-sitter-hl-face:markup.quote ((t (:slant italic))))
   `(tree-sitter-hl-face:markup.raw.block ((t (:foreground ,g-2))))
   `(tree-sitter-hl-face:markup.raw.inline ((t (:foreground ,g-2 :background ,g-10))))
   `(tree-sitter-hl-face:markup.strikethrough ((t (:strike-through t))))
   `(tree-sitter-hl-face:method.call ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:namespace ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:number ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:operator ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:property ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:property.definition ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:punctuation ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:punctuation.bracket ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:punctuation.delimiter ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:punctuation.special ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:special ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:string ((t (:inherit font-lock-string-face))))
   `(tree-sitter-hl-face:string.escape ((t (:inherit font-lock-string-face))))
   `(tree-sitter-hl-face:string.regexp ((t (:inherit font-lock-string-face))))
   `(tree-sitter-hl-face:string.special ((t (:inherit font-lock-string-face))))
   `(tree-sitter-hl-face:string.special.path ((t (:inherit font-lock-string-face))))
   `(tree-sitter-hl-face:string.special.symbol ((t (:inherit font-lock-string-face))))
   `(tree-sitter-hl-face:string.special.url ((t (:inherit font-lock-string-face))))
   `(tree-sitter-hl-face:string.symbol ((t (:inherit font-lock-string-face))))
   `(tree-sitter-hl-face:tag ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:type ((t (:inherit font-lock-type-face))))
   `(tree-sitter-hl-face:type.argument ((t (:inherit font-lock-type-face))))
   `(tree-sitter-hl-face:type.builtin ((t (:inherit font-lock-type-face))))
   `(tree-sitter-hl-face:type.enum.variant ((t (:inherit font-lock-type-face))))
   `(tree-sitter-hl-face:type.enum.variant.builtin ((t (:inherit font-lock-type-face))))
   `(tree-sitter-hl-face:type.parameter ((t (:inherit font-lock-type-face))))
   `(tree-sitter-hl-face:variable ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:variable.builtin ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:variable.other.member ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:variable.parameter ((t (:foreground ,foreground :weight normal :slant normal))))
   `(tree-sitter-hl-face:warning ((t (:foreground ,orange-golden))))

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
   theme
   '(frame-background-mode 'dark)
   `(ansi-color-names-vector [,background ,red-ember ,orange-glow
                             ,orange-smolder ,blue ,g-4 ,g-3 ,g-2]))))

(defconst ashen--c-standard-types
  '("size_t" "ptrdiff_t" "va_list" "wchar_t" "char8_t" "char16_t" "char32_t"
    "intptr_t" "uintptr_t" "intmax_t" "uintmax_t"
    "int8_t" "uint8_t" "int16_t" "uint16_t" "int32_t" "uint32_t"
    "int64_t" "uint64_t" "int_least8_t" "uint_least8_t"
    "int_least16_t" "uint_least16_t" "int_least32_t" "uint_least32_t"
    "int_least64_t" "uint_least64_t" "int_fast8_t" "uint_fast8_t"
    "int_fast16_t" "uint_fast16_t" "int_fast32_t" "uint_fast32_t"
    "int_fast64_t" "uint_fast64_t"))

(defconst ashen--preproc-token-regexp
  (rx (or (seq "//" (* nonl))
          (seq "/*" (*? anything) "*/")
          (seq "\"" (* (or (seq "\\" anything) (not (any "\"\\")))) "\"")
          (seq "'" (* (or (seq "\\" anything) (not (any "'\\")))) "'"))))

(defun ashen--fontify-preproc (node override start end &rest _)
  "Fontify quoted literals within a preprocessor NODE."
  (save-excursion
    (goto-char (treesit-node-start node))
    (while (re-search-forward ashen--preproc-token-regexp (treesit-node-end node) t)
      (treesit-fontify-with-override
       (match-beginning 0) (match-end 0)
       (if (memq (char-after (match-beginning 0)) '(?\" ?\'))
           'font-lock-string-face
         'font-lock-comment-face)
       override start end))))

(defun ashen--c-rules ()
  "Return the additional restrained C fontification rules."
  (treesit-font-lock-rules
   :language 'c :feature 'ashen-type
   `((primitive_type) @font-lock-type-face
     (sized_type_specifier) @font-lock-type-face
     ((type_identifier) @font-lock-type-face
      (:match ,(concat "\\`" (regexp-opt ashen--c-standard-types) "\\'")
              @font-lock-type-face))
     (struct_specifier name: (type_identifier) @font-lock-type-face)
     (enum_specifier name: (type_identifier) @font-lock-type-face))
   :language 'c :feature 'ashen-literal
   '((char_literal) @font-lock-string-face
     (true) @font-lock-keyword-face
     (false) @font-lock-keyword-face)
   :language 'c :feature 'ashen-preproc :override t
   '((preproc_arg) @ashen--fontify-preproc)))

(defvar-local ashen--saved-c-settings nil)

(defun ashen--restore-c-settings ()
  "Restore this buffer's fontification before the Ashen profile."
  (when ashen--saved-c-settings
    (dolist (entry ashen--saved-c-settings)
      (if (nth 1 entry)
          (set (make-local-variable (car entry)) (nth 2 entry))
        (kill-local-variable (car entry))))
    (setq ashen--saved-c-settings nil)
    (font-lock-flush)))

(defun ashen--update-c-buffer ()
  "Match this C buffer's fontification to the active theme."
  (when (eq major-mode 'c-ts-mode)
    (if (not (memq (car custom-enabled-themes) '(ashen-minimal-hc ashen-minimal)))
        (ashen--restore-c-settings)
      (when (and (bound-and-true-p treesit-font-lock-settings)
                 (not ashen--saved-c-settings))
        (setq ashen--saved-c-settings
              (mapcar (lambda (variable)
                        (list variable (local-variable-p variable) (symbol-value variable)))
                      '(treesit-font-lock-settings treesit-font-lock-feature-list)))
        (condition-case error-data
            (progn
              (setq-local treesit-font-lock-settings
                          (append (copy-tree treesit-font-lock-settings) (ashen--c-rules)))
              (setq-local treesit-font-lock-feature-list
                          '((comment document)
                            (keyword preprocessor string ashen-type ashen-literal ashen-preproc)))
              (treesit-font-lock-recompute-features)
              (font-lock-flush))
          (error
           (ashen--restore-c-settings)
           (display-warning 'ashen (error-message-string error-data))))))))

(defun ashen--sync-c-buffers (&rest _)
  "Update existing C buffers after a theme change."
  (dolist (buffer (buffer-list))
    (with-current-buffer buffer
      (ashen--update-c-buffer))))

(when (>= emacs-major-version 29)
  (add-hook 'enable-theme-functions #'ashen--sync-c-buffers)
  (add-hook 'disable-theme-functions #'ashen--sync-c-buffers)
  (add-hook 'c-ts-mode-hook #'ashen--update-c-buffer))

(provide 'ashen-minimal-theme-common)

