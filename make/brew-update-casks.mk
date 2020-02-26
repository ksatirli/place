.PHONY update-brew-casks: check-for-brew
update-brew-casks: check-for-brew # updates Brew Casks
	$(info $(sign-place)  Updating Brew Casks)
	@brew \
		cu \
			--all
