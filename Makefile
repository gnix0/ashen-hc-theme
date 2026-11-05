EMACS ?= emacs

.PHONY: check
check:
	$(EMACS) -Q --batch --eval '(setq byte-compile-error-on-warn t)' -f batch-byte-compile ashen-hc-theme.el
