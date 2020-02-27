.PHONY set-defaults:
set-defaults: check-for-ansible # sets macOS Defaults
	@$(ansible-binary) \
		--skip-tags="$(skip-tags)" \
		--extra-vars="$(extra-vars)" \
		--tags="set-macos-defaults" \
		$(verbosity) \
		"ansible/main.yml"
