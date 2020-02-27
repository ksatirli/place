###
#	Utilities
###
.PHONY: brew-fetch-scripts
brew-fetch-scripts: check-for-curl
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
brew-install: create-config-directory check-for-ruby brew-fetch-scripts

.PHONY brew-postinstall:
brew-postinstall:
ifeq ($(shell which brew 2>/dev/null 2>&1; echo $$?), 1)
	$(info $(sign-warning)  brew is not available in $$PATH)
	$(info Nothing to uninstall)
	@exit 0
else
	$(info $(sign-place)  Disabling Brew Analytics)
	@brew \
		analytics off
	@brew \
		analytics state
endif

###
#	User-facing targets
###
.PHONY brew:
brew: brew-install # fetches Brew Installer and installs Brew
	$(info $(sign-place)  Installing Brew)
	@$(ruby-binary) "$(base-directory)/$(brew-installer-file)"

.PHONY brew-clean:
brew-clean: check-for-brew # clean up cached Brew files
	$(info $(sign-place)  Cleaning Brew assets (older than $(brew-prune-days) days))
	@brew \
		cleanup \
			--prune "$(brew-prune-days)"

.PHONY brew-update:
brew-update: check-for-brew # updates Brew
	$(info $(sign-place)  Updating Brew)
	@brew update

.PHONY brew-update-casks: check-for-brew
brew-update-casks: check-for-brew # updates Brew Casks
	$(info $(sign-place)  Updating Brew Casks)
	@brew \
		cu \
			--all

.PHONY brew-upgrade:
brew-upgrade: check-for-brew # upgrades Brew installation
	$(info $(sign-place)  Upgrading Brew)
	@brew upgrade

.PHONY brewfile:
brewfile: check-for-brew # installs Brews, Taps, and Casks from user-specified Brewfile
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
