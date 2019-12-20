.PHONY ansible-install:
ansible-install: # installs Ansible
	@echo
	@echo "$(place-sign) Installing Ansible with \`$(pip-binary)\`"
	@echo
	@$(pip-binary) \
		install \
			ansible==$(ansible-version)
	@echo
