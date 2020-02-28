.PHONY dotfiles:
dotfiles: # Syncs Dotfiles from local repository to `$(HOME)`
	@$(ansible-binary) \
		--extra-vars="$(extra-vars)" \
		--tags="dotfiles" \
		$(verbosity) \
		"ansible/main.yml"
