.PHONY install-ruby-gems:
install-ruby-gems: check-for-ruby # installs Ruby Gems
	@$(ansible-binary) \
		--skip-tags="$(skip-tags)" \
		--extra-vars="$(extra-vars)" \
		--tags="install-ruby-gems" \
		$(verbosity) \
		"ansible/main.yml"
