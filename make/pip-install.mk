.PHONY pip-install:
pip-install: # installs pip
ifeq ($(shell which easy_install >/dev/null 2>&1; echo $$?), 1)
	$(info $(warning-sign)  easy_install is not available in $$PATH)
	@exit 1
else
	@echo
	@echo "$(place-sign)  Installing pip using \`easy_install\`"
	@echo
	@echo -e "$(color-bright)$(warning-sign)  This operation requires root privilege$(color-off)"
	@echo
	@sudo easy_install $(pip-binary)
	@echo
endif