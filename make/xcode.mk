.PHONY xcode:
xcode: check-for-xcode-select # Installs Xcode
	$(info $(sign-place)  Starting Xcode CLI Tools Installer)
	@-xcode-select \
		--install
