.PHONY xcode-reset:
xcode-reset: # resets Xcode
	@echo
	@echo "$(place-sign) Resetting Xcode CLI Tools"
	@echo
	@echo "This operation requires root privileges"
	@echo
	@sudo xcode-select \
		--reset
	@echo