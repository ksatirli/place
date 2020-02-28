.PHONY gems:
gems: check-for-ruby check-for-ansible # Installs Ruby Gems
	@$(ansible-binary) \
		--extra-vars="$(extra-vars)" \
		--tags="gems" \
		$(verbosity) \
		"ansible/main.yml"
