.PHONY sync-dotfiles:
sync-dotfiles: # Syncs Dotfiles from local repository to `$(HOME)`
ifeq ("$(wildcard $(dotfiles))","")
	$(info $(sign-warning)  No directory found at $(dotfiles))
	$(info Consider running make dotfiles-update)
	@exit 1
else
	$(info $(sign-place)  Syncing Dotfiles from `$(dotfiles)` to `$(HOME)`)
	@rsync \
      --verbose \
      --checksum \
      --archive \
      --recursive \
      --update \
      --links \
      --executability \
      --specials \
      --exclude-from="$(dotfiles_excludes)" \
      --human-readable \
      "$(dotfiles)/" "$(HOME)/"
endif
