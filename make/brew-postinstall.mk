.PHONY postinstall-brew:
postinstall-brew: # runs Brew Post-install actions
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
