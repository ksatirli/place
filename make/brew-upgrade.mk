.PHONY brew-upgrade:
brew-upgrade: # upgrades Brew installation
ifeq ($(shell which brew 2>/dev/null 2>&1; echo $$?), 1)
	$(info $(sign-warning)  brew is not available in $$PATH)
	$(info Consider running make brew-install)
	@exit 1
else
	@echo
	@echo "$(sign-place)  Upgrading Brew"
	@echo
	@brew upgrade
endif