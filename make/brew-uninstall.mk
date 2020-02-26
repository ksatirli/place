.PHONY: uninstall-brew
uninstall-brew: check-for-ruby check-for-brew # uninstalls Brew
	$(info $(sign-place)  Uninstalling Brew)
	@$(ruby-binary) "$(base-directory)/$(brew-uninstaller-file)"
