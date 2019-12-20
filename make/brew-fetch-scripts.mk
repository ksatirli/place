.PHONY: brew-fetch-scripts
brew-fetch-scripts: # fetches Brew Installer and Uninstaller scripts
ifeq ($(shell which curl2 >/dev/null 2>&1; echo $$?), 1)
	$(info $(warning-sign)  curl is not available in $$PATH)
	@exit 1
else
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
endif