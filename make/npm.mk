.PHONY npm:
npm: check-for-ansible # installs global NPM Packages
	@$(ansible-binary) \
		--extra-vars="$(extra-vars)" \
		--tags="npm" \
		$(verbosity) \
		"ansible/main.yml"
