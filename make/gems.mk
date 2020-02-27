.PHONY gems:
gems: check-for-ruby check-for-ansible # installs Ruby Gems
	@$(ansible-binary) \
		--skip-tags="$(skip-tags)" \
		--extra-vars="$(extra-vars)" \
		--tags="install-ruby-gems" \
		$(verbosity) \
		"ansible/main.yml"
