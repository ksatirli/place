.PHONY npm:
npm: check-for-ansible # Installs global NPM packages
	@$(ansible-binary) \
		--extra-vars="$(extra-vars)" \
		--tags="npm" \
		$(verbosity) \
		"ansible/main.yml"
