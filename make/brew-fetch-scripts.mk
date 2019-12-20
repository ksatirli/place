.PHONY: brew-fetch-scripts
brew-fetch-scripts: # fetches Brew Installer and Uninstaller scripts
ifeq (, $(shell which curl))
	$(error $(warning-sign)  curl is not available in $$PATH))
endif

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