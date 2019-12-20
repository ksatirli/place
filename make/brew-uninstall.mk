.PHONY: brew-uninstall
brew-uninstall: # uninstalls Brew
	@echo
	@echo "$(place-sign) Fetching Brew Uninstaller"

	@curl \
		--silent \
		--location \
		--output "$(place-directory)/$(brew-uninstaller-file)" \
		"$(brew-uninstaller-url)"

	@echo
	@echo "$(place-sign) Uninstalling Brew"
	@echo
	# @ruby "$(place-directory)/$(brew-uninstaller-file)"