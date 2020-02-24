.PHONY: brew-uninstall
brew-uninstall: # uninstalls Brew
ifeq ($(shell which brew 2>/dev/null 2>&1; echo $$?), 1)
	$(info $(sign-warning)  brew is not available in $$PATH)
	$(info Nothing to uninstall)
	@exit 0
else ifeq ($(shell which $(ruby-binary) >/dev/null 2>&1; echo $$?), 1)
	$(info $(sign-warning)  $(ruby-binary) is not available in $$PATH)
	@exit 1
else
	@echo
	@echo "$(sign-place)  Uninstalling Brew"
	@echo
	@$(ruby-binary) "$(base-directory)/$(brew-uninstaller-file)"
endif
