.PHONY dotfiles-update:
dotfiles-update: # fetches (and updates) Dotfiles from remote repository
ifeq ("$(wildcard $(dotfiles))","")
	$(info $(sign-warning)  No directory found at $(dotfiles))
	$(info $(sign-place)  Clone Dotfiles from $(dotfiles_repository))
	@git \
       clone \
         --depth 1 \
         "$(dotfiles_repo)" "$(dotfiles)"
else ifeq ("$(wildcard $(dotfiles))","$(dotfiles)")
	$(info $(sign-place)  Found Dotfiles in $(dotfiles))
	$(info $(sign-place)  Pulling in changes)
	@git \
		-C "$(dotfiles)" \
		pull
else
	$(error $(sign-warning) Unhandled error)
endif
