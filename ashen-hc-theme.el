
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
;; Ashen color theme by Daniel Fichtinger a.k.a. ficd.
;; Adapted from its official Emacs port with a pure black background by
;; Gustavo Arantes a.k.a. gnix.
;;
;; Add this directory to `custom-theme-load-path', then use
;; (load-theme 'ashen-hc t).

;;; Code:

(deftheme ashen-hc
  "A restrained, red-accented Ashen palette on pure black.")

;; Keep Ashen's palette and black UI, but give syntax a smaller set of roles:
;; off-white for ordinary code, ember red for keywords and constants,
;; and subtle warm accents for strings and preprocessor directives.
(let ((background     "#000000")
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
      (foreground     "#d5d5d5"))
  (custom-theme-set-faces
   'ashen-hc

   ;; Pure black foundations and neutral editor chrome.
   `(default ((t (:foreground ,g-3 :background ,background
                  :weight normal :slant normal :underline nil))))
   `(cursor ((t (:background ,g-5))))
   `(fringe ((t (:foreground ,g-7 :background ,background))))
   `(border ((t (:foreground ,g-8 :background ,background))))
   `(internal-border ((t (:background ,background))))
   `(child-frame-border ((t (:background ,g-7))))
   `(line-number ((t (:foreground ,g-3 :background ,background))))
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

   `(font-lock-comment-face ((t (:foreground ,g-6 :slant italic))))
   `(font-lock-comment-delimiter-face ((t (:foreground ,g-6 :slant italic))))
   `(font-lock-doc-face ((t (:foreground ,g-5))))
   `(font-lock-doc-markup-face ((t (:foreground ,g-4))))
   `(font-lock-string-face ((t (:foreground ,red-glowing))))
   `(font-lock-function-name-face ((t (:foreground ,g-1 :weight bold))))
   `(font-lock-function-call-face ((t (:foreground ,g-2 :weight normal))))
   `(font-lock-builtin-face ((t (:foreground ,g-2))))
   `(font-lock-keyword-face ((t (:foreground ,red-ember))))
   `(font-lock-preprocessor-face ((t (:foreground ,orange-blaze))))
   `(font-lock-constant-face ((t (:foreground ,red-ember))))
   `(font-lock-type-face ((t (:foreground ,g-2))))
   `(font-lock-variable-name-face ((t (:foreground ,foreground))))
   `(font-lock-variable-use-face ((t (:foreground ,foreground))))
   `(font-lock-property-name-face ((t (:foreground ,g-3))))
   `(font-lock-property-use-face ((t (:foreground ,g-3))))
   `(font-lock-number-face ((t (:foreground ,g-3))))
   `(font-lock-operator-face ((t (:foreground ,g-3))))
   `(font-lock-punctuation-face ((t (:foreground ,g-3))))
   `(font-lock-misc-punctuation-face ((t (:foreground ,g-3))))
   `(font-lock-bracket-face ((t (:foreground ,g-4))))
   `(font-lock-delimiter-face ((t (:foreground ,g-3))))
   `(font-lock-escape-face ((t (:foreground ,orange-blaze))))
   `(font-lock-regexp-grouping-backslash ((t (:foreground ,g-2 :weight normal))))
   `(font-lock-regexp-grouping-construct ((t (:foreground ,g-2 :weight normal))))
   `(font-lock-warning-face ((t (:foreground ,orange-golden :weight bold))))
   `(font-lock-negation-char-face ((t (:foreground ,g-3))))

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

   ;; Official Eglot hints, without requiring Eglot during theme loading.
   `(eglot-inlay-hint-face ((t (:foreground ,g-6 :height 0.8 :slant italic))))
   `(eglot-type-hint-face ((t (:inherit eglot-inlay-hint-face))))
   `(eglot-parameter-hint-face ((t (:inherit eglot-inlay-hint-face))))

   `(tooltip ((t (:background ,g-9 :foreground ,foreground :box (:line-width 1 :color ,g-6)))))
   `(completions-common-part ((t (:foreground ,g-6))))
   `(completions-first-difference ((t (:foreground ,foreground :weight bold))))
   `(completions-annotations ((t (:foreground ,g-5 :slant italic))))
   `(completions-group-title ((t (:foreground ,orange-glow :weight bold))))
   `(completions-highlight ((t (:foreground ,background :background ,g-4 :inverse-video nil))))
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
   `(menu ((t (:foreground ,foreground :background ,background :inverse-video nil))))
   `(tty-menu-enabled-face ((t (:foreground ,foreground :background ,background :weight normal))))
   `(tty-menu-disabled-face ((t (:foreground ,g-7 :background ,background))))
   `(scroll-bar ((t (:foreground ,g-7 :background ,g-10))))

   `(tty-menu-selected-face ((t (:foreground ,background :background ,g-4 :inverse-video nil))))
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

   ;; Official Org headings and code.  Extend its orange heading pattern
   ;; to levels 4-8; foundational code blocks remain black.
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

   ;; Built-in *-ts-mode modes use the font-lock faces above.
   `(tree-sitter-hl-face:attribute ((t (:foreground ,g-4 :slant italic))))
   `(tree-sitter-hl-face:comment ((t (:foreground ,g-6 :slant italic))))
   `(tree-sitter-hl-face:comment.block.documentation ((t (:foreground ,g-6 :slant italic))))
   `(tree-sitter-hl-face:comment.unused ((t (:foreground ,g-6 :slant italic :strike-through t))))
   `(tree-sitter-hl-face:conceal ((t (:foreground ,g-5 :slant italic))))
   `(tree-sitter-hl-face:constructor ((t (:foreground ,g-1))))
   `(tree-sitter-hl-face:constant ((t (:foreground ,red-ember))))
   `(tree-sitter-hl-face:constant.builtin ((t (:foreground ,red-ember))))
   `(tree-sitter-hl-face:constant.builtin.boolean ((t (:foreground ,red-ember))))
   `(tree-sitter-hl-face:constant.character ((t (:foreground ,red-glowing :weight bold))))
   `(tree-sitter-hl-face:constant.character.escape ((t (:foreground ,orange-blaze))))
   `(tree-sitter-hl-face:constant.macro ((t (:foreground ,red-ember))))
   `(tree-sitter-hl-face:constant.numeric ((t (:foreground ,g-3))))
   `(tree-sitter-hl-face:diff.delta ((t (:foreground ,brown))))
   `(tree-sitter-hl-face:diff.minus ((t (:foreground ,red-ember))))
   `(tree-sitter-hl-face:diff.plus ((t (:foreground ,g-6))))
   `(tree-sitter-hl-face:error ((t (:foreground ,red-flame))))
   `(tree-sitter-hl-face:function ((t (:foreground ,g-1 :weight bold))))
   `(tree-sitter-hl-face:function.builtin ((t (:foreground ,g-1 :weight bold :slant italic))))
   `(tree-sitter-hl-face:function.call ((t (:foreground ,g-2 :weight normal))))
   `(tree-sitter-hl-face:function.macro ((t (:foreground ,g-2))))
   `(tree-sitter-hl-face:hint ((t (:foreground ,g-4))))
   `(tree-sitter-hl-face:info ((t (:foreground ,g-2))))
   `(tree-sitter-hl-face:keyword ((t (:foreground ,red-ember))))
   `(tree-sitter-hl-face:keyword.conditional ((t (:foreground ,red-ember))))
   `(tree-sitter-hl-face:keyword.control.conditional ((t (:foreground ,red-ember))))
   `(tree-sitter-hl-face:keyword.control.directive ((t (:foreground ,red-ember :slant italic))))
   `(tree-sitter-hl-face:keyword.control.import ((t (:foreground ,red-ember))))
   `(tree-sitter-hl-face:keyword.directive ((t (:foreground ,red-ember :slant italic))))
   `(tree-sitter-hl-face:keyword.operator ((t (:foreground ,g-3))))
   `(tree-sitter-hl-face:keyword.storage ((t (:foreground ,red-ember))))
   `(tree-sitter-hl-face:keyword.storage.modifier ((t (:foreground ,red-ember :slant italic))))
   `(tree-sitter-hl-face:keyword.storage.modifier.mut ((t (:foreground ,red-ember :slant italic))))
   `(tree-sitter-hl-face:keyword.storage.modifier.ref ((t (:foreground ,red-ember :slant italic))))
   `(tree-sitter-hl-face:label ((t (:foreground ,red-ember))))
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
   `(tree-sitter-hl-face:method.call ((t (:foreground ,g-2 :weight normal))))
   `(tree-sitter-hl-face:namespace ((t (:foreground ,g-2 :weight bold))))
   `(tree-sitter-hl-face:number ((t (:foreground ,g-3))))
   `(tree-sitter-hl-face:operator ((t (:foreground ,g-3))))
   `(tree-sitter-hl-face:property ((t (:foreground ,g-3))))
   `(tree-sitter-hl-face:property.definition ((t (:foreground ,g-2 :weight bold))))
   `(tree-sitter-hl-face:punctuation ((t (:foreground ,g-3))))
   `(tree-sitter-hl-face:punctuation.bracket ((t (:foreground ,g-4))))
   `(tree-sitter-hl-face:punctuation.delimiter ((t (:foreground ,g-3))))
   `(tree-sitter-hl-face:punctuation.special ((t (:foreground ,g-3))))
   `(tree-sitter-hl-face:special ((t (:foreground ,g-3))))
   `(tree-sitter-hl-face:string ((t (:foreground ,red-glowing))))
   `(tree-sitter-hl-face:string.escape ((t (:foreground ,orange-blaze))))
   `(tree-sitter-hl-face:string.regexp ((t (:foreground ,red-glowing))))
   `(tree-sitter-hl-face:string.special ((t (:foreground ,g-2))))
   `(tree-sitter-hl-face:string.special.path ((t (:foreground ,red-glowing :weight bold))))
   `(tree-sitter-hl-face:string.special.symbol ((t (:foreground ,g-2))))
   `(tree-sitter-hl-face:string.special.url ((t (:foreground ,red-glowing :weight bold))))
   `(tree-sitter-hl-face:string.symbol ((t (:foreground ,g-2))))
   `(tree-sitter-hl-face:tag ((t (:foreground ,g-2 :slant italic))))
   `(tree-sitter-hl-face:type ((t (:foreground ,g-2))))
   `(tree-sitter-hl-face:type.argument ((t (:foreground ,g-2))))
   `(tree-sitter-hl-face:type.builtin ((t (:foreground ,g-2))))
   `(tree-sitter-hl-face:type.enum.variant ((t (:foreground ,red-ember))))
   `(tree-sitter-hl-face:type.enum.variant.builtin ((t (:foreground ,red-ember))))
   `(tree-sitter-hl-face:type.parameter ((t (:foreground ,g-2))))
   `(tree-sitter-hl-face:variable ((t (:foreground ,g-2))))
   `(tree-sitter-hl-face:variable.builtin ((t (:foreground ,g-2))))
   `(tree-sitter-hl-face:variable.other.member ((t (:foreground ,g-3))))
   `(tree-sitter-hl-face:variable.parameter ((t (:foreground ,g-3 :slant italic))))
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
