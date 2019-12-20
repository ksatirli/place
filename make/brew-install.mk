.PHONY brew-install:
brew-install: create-config-directory # installs Brew
	@echo
	@echo "$(place-sign) Fetching Brew Installer"

	@curl \
		--silent \
		--location \
		--output "$(place-directory)/$(brew-installer-file)" \
		"$(brew-installer-url)"

	@echo
	@echo "$(place-sign) Installing Brew"
	@echo
	@ruby "$(place-directory)/$(brew-installer-file)"