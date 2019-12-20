	@echo
	@echo "$(place-sign)  Fetching Brew Installer"

	@curl \
		--silent \
		--location \
		--output "$(place-directory)/$(brew-installer-file)" \
		"$(brew-installer-url)"

	@echo
	@echo "$(place-sign)  Fetching Brew Uninstaller"

	@curl \
		--silent \
		--location \
		--output "$(place-directory)/$(brew-uninstaller-file)" \
		"$(brew-uninstaller-url)"