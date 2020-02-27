.PHONY npm-packages:
npm-packages: check-for-ansible # installs global NPM Packages
	@$(ansible-binary) \
		--skip-tags="$(skip-tags)" \
		--extra-vars="$(extra-vars)" \
		--tags="install-npm-packages" \
		$(verbosity) \
		"ansible/main.yml"
