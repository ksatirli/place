.PHONY xcode-reset:
xcode-reset: # resets Xcode
ifeq ($(shell which xcode-select2 >/dev/null 2>&1; echo $$?), 1)
	$(info $(sign-warning)  xcode-select is not available in $$PATH)
	@exit 1
else
	@echo
	@echo "$(sign-place)  Resetting Xcode CLI Tools"
	@echo
	@echo -e "$(color-bright)$(sign-warning)  This operation requires root privilege$(color-off)"
	@echo
	@sudo xcode-select \
		--reset
	@echo
endif
