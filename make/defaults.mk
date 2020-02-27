.PHONY defaults:
defaults: check-for-ansible # sets macOS Defaults
	@$(ansible-binary) \
		--extra-vars="$(extra-vars)" \
		--tags="macos-defaults" \
		$(verbosity) \
		"ansible/main.yml"
