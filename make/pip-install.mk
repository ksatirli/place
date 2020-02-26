.PHONY pip-install:
pip-install: # installs pip
ifeq ($(shell which easy_install >/dev/null 2>&1; echo $$?), 1)
	$(info $(sign-warning)  easy_install is not available in $$PATH)
	@exit 1
else
	$(info $(sign-place)  Installing pip using `easy_install`)
	$(info $(color-bright)$(sign-warning)  This operation requires root privilege$(color-off))
	@sudo \
		easy_install $(pip-binary)
endif
