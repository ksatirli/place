.PHONY: brew-uninstall
brew-uninstall: # uninstalls Brew
ifeq (, $(shell which ruby))
	$(error $(warning-sign)  ruby is not available in $$PATH))
endif

	@echo
	@echo "$(place-sign)  Uninstalling Brew"
	@echo
	@ruby "$(place-directory)/$(brew-uninstaller-file)"