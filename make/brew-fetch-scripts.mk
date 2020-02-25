.PHONY: brew-fetch-scripts
brew-fetch-scripts: # fetches Brew Installer and Uninstaller scripts
ifeq ($(shell which curl >/dev/null 2>&1; echo $$?), 1)
	$(info $(sign-warning)  curl is not available in $$PATH)
	@exit 1
else
	@echo
	@echo "$(sign-place)  Fetching Brew Installer"

	@curl \
		--silent \
		--location \
		--output "$(base-directory)/$(brew-installer-file)" \
		"$(brew-installer-url)"

	@echo
	@echo "$(sign-place)  Fetching Brew Uninstaller"

	@curl \
		--silent \
		--location \
		--output "$(base-directory)/$(brew-uninstaller-file)" \
		"$(brew-uninstaller-url)"
endif
