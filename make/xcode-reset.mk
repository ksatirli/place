.PHONY xcode-reset:
xcode-reset: # resets Xcode
ifeq (, $(shell which xcode-select))
	$(error $(warning-sign)  xcode-select is not available in $$PATH))
endif

	@echo
	@echo "$(place-sign)  Resetting Xcode CLI Tools"
	@echo
	@echo -e "$(color-bright)$(warning-sign)  This operation requires root privilege$(color-off)"
	@echo
	@sudo xcode-select \
		--reset
	@echo