.PHONY brew-install-brewfile:
brew-install-brewfile: # installs Brews, Taps, and Casks from user-specified Brewfile
ifeq ($(shell which brew 2>/dev/null 2>&1; echo $$?), 1)
	$(info $(sign-warning)  brew is not available in $$PATH)
	$(info Consider running make brew-install)
	@exit 1
else ifeq ("$(wildcard $(brewfile))","")
	$(info $(sign-warning)  No Brewfile available at $(brewfile))
	@exit 1
else
	@echo
	@echo "$(sign-place) Installing Brews, Taps, and Casks from Brewfile"
	@echo
	@echo -e "$(color-bright)$(sign-warning)  Some operations might require root privilege$(color-off)"
	@echo
	@brew bundle --file=$(brewfile)
endif