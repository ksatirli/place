.PHONY clean-brew:
clean-brew: check-for-brew # clean up cached Brew files
	$(info $(sign-place)  Cleaning Brew assets (older than $(brew-prune-days) days))
	@brew \
		cleanup \
			--prune "$(brew-prune-days)"
