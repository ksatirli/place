.PHONY update-brew:
update-brew: check-for-brew # updates Brew
	$(info $(sign-place)  Updating Brew)
	@brew update
