.PHONY pip:
pip: check-for-ansible # Installs pip packages
	@$(ansible-binary) \
		--extra-vars="$(extra-vars)" \
		--tags="pip" \
		$(verbosity) \
		"ansible/main.yml"
