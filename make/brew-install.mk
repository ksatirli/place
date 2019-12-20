.PHONY brew-install:
brew-install: create-config-directory brew-fetch-scripts # fetches Brew Installer and Uinstall installs Brew
	@echo
	@echo "$(place-sign) Installing Brew"
	@echo
	@ruby "$(place-directory)/$(brew-installer-file)"