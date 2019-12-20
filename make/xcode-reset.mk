.PHONY xcode-reset:
xcode-reset: # resets Xcode
	@echo
	@echo "$(place-sign) Resetting Xcode CLI Tools"
	@echo
	@echo -e "$(color-bright)$(warning-sign) This operation requires root privilege$(color-off)"
	@echo
	@sudo xcode-select \
		--reset
	@echo