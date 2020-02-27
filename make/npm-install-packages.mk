.PHONY install-npm-packages:
install-npm-packages: # installs global NPM Packages
	@$(ansible-binary) \
		--skip-tags="$(skip-tags)" \
		--extra-vars="$(extra-vars)" \
		--tags="install-npm-packages" \
		$(verbosity) \
		"ansible/main.yml"
