.PHONY brew-install:
brew-install: create-config-directory brew-fetch-scripts # fetches Brew Installer and Uinstall installs Brew
ifeq (, $(shell which ruby))
	$(error $(warning-sign)  ruby is not available in $$PATH))
endif

	@echo
	@echo "$(place-sign)  Installing Brew"
	@echo
	@ruby "$(place-directory)/$(brew-installer-file)"