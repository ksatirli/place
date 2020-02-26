.PHONY upgrade-brew:
upgrade-brew: check-for-brew # upgrades Brew installation
	$(info $(sign-place)  Upgrading Brew)
	@brew upgrade
