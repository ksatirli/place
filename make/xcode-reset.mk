.PHONY xcode-reset:
xcode-reset: # resets Xcode
ifeq ($(shell which xcode-select >/dev/null 2>&1; echo $$?), 1)
	$(info $(sign-warning)  xcode-select is not available in $$PATH)
	@exit 1
else
	$(info $(sign-place)  Resetting Xcode CLI Tools)
	$(info $(color-bright)$(sign-warning)  This operation requires root privilege$(color-off))
	@sudo xcode-select \
		--reset
endif
