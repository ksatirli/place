.PHONY macos-defaults:
macos-defaults: check-for-ansible # sets macOS Defaults
	echo $(MAKECMDGOALS)
	exit 1
	@$(ansible-binary) \
		--skip-tags="$(skip-tags)" \
		--extra-vars="$(extra-vars)" \
		--tags="set-macos-defaults" \
		$(verbosity) \
		"ansible/main.yml"
