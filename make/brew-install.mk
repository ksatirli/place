.PHONY brew-install:
brew-install: create-config-directory brew-fetch-scripts # fetches Brew Installer and Uinstall installs Brew
ifeq ($(shell which $(ruby-binary) >/dev/null 2>&1; echo $$?), 1)
	$(info $(warning-sign)  $(ruby-binary) is not available in $$PATH)
	@exit 1
else
	@echo
	@echo "$(place-sign)  Installing Brew"
	@echo
	@$(ruby-binary) "$(place-directory)/$(brew-installer-file)"
endif