.PHONY brew-update:
brew-update: # updates Brew
ifeq ($(shell which brew 2>/dev/null 2>&1; echo $$?), 1)
	$(info $(sign-warning)  brew is not available in $$PATH)
	$(info Consider running make brew-install)
	@exit 1
else
	$(info $(sign-place)  Updating Brew)
	@brew update
endif
