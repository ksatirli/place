.PHONY: fetch-brew-scripts
fetch-brew-scripts: check-for-curl # fetches Brew Installer and Uninstaller scripts
	$(info $(sign-place)  Fetching Brew Installer)
	@curl \
		--silent \
		--location \
		--output "$(base-directory)/$(brew-installer-file)" \
		"$(brew-installer-url)"

	$(info $(sign-place)  Fetching Brew Uninstaller)
	@curl \
		--silent \
		--location \
		--output "$(base-directory)/$(brew-uninstaller-file)" \
		"$(brew-uninstaller-url)"
