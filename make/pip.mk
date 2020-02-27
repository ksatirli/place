.PHONY pip:
pip: check-for-ansible # installs pip packages
	@$(ansible-binary) \
		--extra-vars="$(extra-vars)" \
		--tags="pip" \
		$(verbosity) \
		"ansible/main.yml"
