EMACS ?= emacs

.PHONY: check
check:
	$(EMACS) -Q --batch --eval '(setq byte-compile-error-on-warn t)' -f batch-byte-compile ashen-hc-theme.el
	$(EMACS) -Q --batch -l test/ashen-hc-theme-test.el -f ert-run-tests-batch-and-exit
