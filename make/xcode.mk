.PHONY xcode:
xcode: # Installs Xcode
	$(call has_required,xcode-select)

	$(info $(sign-place)  Starting Xcode CLI Tools Installer)
	@-xcode-select \
		--install
