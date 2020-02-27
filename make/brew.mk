.PHONY brew:
brew: create-config-directory check-for-ruby fetch-brew-scripts # fetches Brew Installer and installs Brew
	$(info $(sign-place)  Installing Brew)
	@$(ruby-binary) "$(base-directory)/$(brew-installer-file)"
