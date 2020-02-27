.PHONY dotfiles:
dotfiles: # Syncs Dotfiles from local repository to `$(HOME)`
	$(ansible-binary) \
		--skip-tags="$(skip-tags)" \
		--extra-vars="$(extra-vars)" \
		--tags="sync-dotfiles" \
		$(verbosity) \
		"ansible/main.yml"
