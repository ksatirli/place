.PHONY brew-update:
brew-update: # updates Brew
ifeq ($(shell which brew 2>/dev/null 2>&1; echo $$?), 1)
	$(info $(sign-warning)  brew is not available in $$PATH)
	$(info Consider running make brew-install)
	@exit 1
else
	@echo
	@echo "$(sign-place)  Updating Brew"
	@echo
	@brew update
endif
