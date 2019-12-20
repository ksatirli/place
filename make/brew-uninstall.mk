.PHONY: brew-uninstall
brew-uninstall: # uninstalls Brew
	@echo
	@echo "$(place-sign) Uninstalling Brew"
	@echo
	@ruby "$(place-directory)/$(brew-uninstaller-file)"