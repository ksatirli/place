.PHONY reset-xcode:
reset-xcode: check-for-xcode-select # resets Xcode
	$(info $(sign-place)  Resetting Xcode CLI Tools)
	$(info $(color-bright)$(sign-warning)  This operation requires root privilege$(color-off))
	@sudo xcode-select \
		--reset
