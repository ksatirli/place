.PHONY defaults:
defaults: check-for-ansible # Sets macOS Defaults
	@$(ansible-binary) \
		--extra-vars="$(extra-vars)" \
		--tags="macos-defaults" \
		$(verbosity) \
		"ansible/main.yml"
