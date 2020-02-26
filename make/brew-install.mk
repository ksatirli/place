.PHONY brew-install:
brew-install: create-config-directory brew-fetch-scripts # fetches Brew Installer and installs Brew
ifeq ($(shell which $(ruby-binary) >/dev/null 2>&1; echo $$?), 1)
	$(info $(sign-warning)  $(ruby-binary) is not available in $$PATH)
	@exit 1
else
	$(info )
	$(info $(sign-place)  Installing Brew)
	$(info )
	@$(ruby-binary) "$(base-directory)/$(brew-installer-file)"
endif
