.PHONY: brew-uninstall
brew-uninstall: # uninstalls Brew
ifeq ($(shell which brew 2>/dev/null 2>&1; echo $$?), 1)
	$(info $(warning-sign)  brew is not available in $$PATH)
	$(info Nothing to uninstall)
	@exit 0
else ifeq ($(shell which $(ruby-binary) >/dev/null 2>&1; echo $$?), 1)
	$(info $(warning-sign)  $(ruby-binary) is not available in $$PATH)
	@exit 1
else
	@echo
	@echo "$(place-sign)  Uninstalling Brew"
	@echo
	@$(ruby-binary) "$(place-directory)/$(brew-uninstaller-file)"
endif