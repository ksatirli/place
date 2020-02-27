.PHONY gems:
gems: check-for-ruby check-for-ansible # installs Ruby Gems
	@$(ansible-binary) \
		--extra-vars="$(extra-vars)" \
		--tags="gems" \
		$(verbosity) \
		"ansible/main.yml"
