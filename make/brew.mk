###
#	Utilities
###
.PHONY: brew-fetch-scripts
brew-fetch-scripts:
	$(call has_required,curl)

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

.PHONY brew-install:
brew-install: create-config-directory brew-fetch-scripts

.PHONY brew-postinstall:
brew-postinstall: check-for-brew

	$(info $(sign-place)  Disabling Brew Analytics)
	@brew \
		analytics off
	@brew \
		analytics state

###
#	User-facing targets
###
.PHONY brew:
brew: brew-install # Fetches Brew Installer and installs Brew
	$(info $(sign-place)  Installing Brew)
	@bash "$(base-directory)/$(brew-installer-file)"

.PHONY brew-clean:
brew-clean: check-for-brew # Cleans up cached Brew files
	$(info $(sign-place)  Cleaning Brew assets (older than $(brew-prune-days) days))
	@brew \
		cleanup \
			--prune "$(brew-prune-days)"

.PHONY brew-outdated:
brew-outdated: check-for-brew # Updates Brew
	$(info $(sign-place)  Listing outdated Brew packages)
	@brew outdated

.PHONY brew-update:
brew-update: check-for-brew # Updates Brew
	$(info $(sign-place)  Updating Brew)
	@brew update

.PHONY brew-update-casks: check-for-brew
brew-update-casks: check-for-brew # Updates Brew Casks
	$(info $(sign-place)  Updating Brew Casks)
	@brew \
		cu \
			--all

.PHONY brew-upgrade:
brew-upgrade: check-for-brew # Upgrades Brew installation
	$(info $(sign-place)  Upgrading Brew)
	@brew upgrade

.PHONY brewfile:
brewfile: check-for-brew # Installs Brews, Taps, and Casks from user-specified Brewfile
ifeq ("$(wildcard $(brewfile))","")
	$(info $(sign-warning)  No Brewfile available at $(brewfile))
	@exit 1
else
	$(info $(sign-place) Installing Brews, Taps, and Casks from Brewfile)
	$(info $(color-bright)$(sign-warning)  Some operations might require root privilege$(color-off))
	@brew \
		bundle \
			--file="$(brewfile)"
endif
