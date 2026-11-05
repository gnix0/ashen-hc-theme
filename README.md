# Ashen HC

[Ashen](https://github.com/ficd0/ashen.nvim) for Emacs, built around a pure
black (`#000000`) foundational background. A standalone theme with no
dependencies, for Emacs 27.1 or newer.

Ashen's foreground colors, syntax roles, and highlight surfaces are preserved.
Editing buffers, inactive windows, fringes, and source blocks sit on black;
selections, search results, completion menus, and mode lines retain their
original contrasting backgrounds. Comments stay upright and functions retain
normal weight, matching Ashen's default style presets.

## Installation

Clone the repository:

```sh
git clone https://github.com/gnix0/ashen-hc-theme ~/.emacs.d/themes/ashen-hc-theme
```

Add this to your Emacs configuration:

```elisp
(add-to-list 'custom-theme-load-path
             (expand-file-name "~/.emacs.d/themes/ashen-hc-theme/"))
(load-theme 'ashen-hc t)
```

You can also copy `ashen-hc-theme.el` to any directory on
`custom-theme-load-path` and select `ashen-hc` with `M-x load-theme`.
For exact colors, use graphical Emacs or a terminal configured for true color.
Disable other enabled themes before loading if you want to avoid their faces
showing through in modes they cover.

## Highlight mapping

The port follows the roles in Ashen's
[default highlight map](https://github.com/ficd0/ashen.nvim/blob/main/lua/ashen/variants/default/theme.lua)
and [palette](https://github.com/ficd0/ashen.nvim/blob/main/lua/ashen/variants/default/colors.lua).
The foundational `background` changes from `#121212` to `#000000`;
the named grayscale and accent colors keep their upstream values.

| Neovim role | Emacs equivalent | Appearance |
| --- | --- | --- |
| `Normal` | `default` | `#b4b4b4` on black |
| `Comment` | `font-lock-comment-face` | `#737373`, upright |
| `String` | `font-lock-string-face`, docstrings | `#DF6464` |
| `Function`, `@function.builtin` | function names/calls, builtins | `#e5e5e5`, normal weight |
| `@keyword`, `PreProc` | keywords, preprocessor | `#B14242` |
| `Constant`, `Type` | constants, types | `#C4693D` |
| `@variable`, `@variable.member` | variables, properties | `#b4b4b4`, `#d5d5d5` |
| `@number` | number face, where the major mode supplies one | `#4A8B8B` |
| `@operator`, `@punctuation.bracket` | operators, brackets | `#D87C4A`, `#737373` |
| `Visual` | `region` | `#323232` background, preserves syntax foregrounds |
| `CursorLine` | `hl-line` | `#212121` background |
| `MatchParen` | `show-paren-match` | `#535353` background |
| `CurSearch` | `isearch` | black on `#D87C4A`, bold |
| `Search` | `lazy-highlight`, `match` | black on `#949494`, bold |
| `StatusLine` | `mode-line`, `header-line` | `#949494` on `#323232` |
| `TabLine`, `TabLineSel` | tab bar / tab line | gray inactive tabs, black selected tabs |
| `Pmenu`, `PmenuSel` | Company / Corfu menus, selected completion | `#323232` / `#535353` backgrounds |
| `NoicePopup` | `tooltip` | `#b4b4b4` on `#191919` |
| `DiffAdd`, `DiffDelete`, `DiffChange` | diff faces, corresponding Magit faces | gray additions, ember deletions, orange changes |
| `DiagnosticUnderline*` | Flymake / Flycheck | colored dotted underlines, waves where dots are unsupported |
| `@text.title`, `@text.literal` | Org headings, inline code | light gray, kindling red |

Emacs font-lock categories do not always separate the same tokens as Neovim's
Tree-sitter captures. Types use the core `Type` role; numbers use `@number`
where available. The theme defines faces without changing major-mode syntax
rules. Modes that do not distinguish numbers, booleans, or builtin constants
continue to use their existing font-lock categories.

Emacs-specific choices are kept small: inactive mode-line text is dimmed to
`#737373`; document links retain clickable underlines; Magit reuses the diff
and cursor-line surfaces. Org document roles use the nearest core text roles.
ANSI colors follow Ashen's terminal palette, including its orange "green"
and repeated bright colors (except bright black).

## Validation

```sh
make check
```

## Credits

Ashen by Daniel Fichtinger a.k.a. ficd. Ported to Emacs by Gustavo Arantes
a.k.a. gnix. [Gruber Darker](https://github.com/rexim/gruber-darker-theme)
served as an implementation reference. MIT license; see the theme header.
