.PHONY brew-cleanup:
brew-cleanup: # clean up cached Brew files
ifeq ($(shell which brew 2>/dev/null 2>&1; echo $$?), 1)
	$(info $(sign-warning)  brew is not available in $$PATH)
	$(info Consider running make brew-install)
	@exit 1
else
	$(info $(sign-place)  Cleaning Brew assets (older than $(brew-prune-days) days))
	@brew \
		cleanup \
			--prune "$(brew-prune-days)"
endif
