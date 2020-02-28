.PHONY ansible:
ansible: check-for-pip # Installs Ansible
	$(info $(sign-place)  Installing Ansible with `$(pip-binary)`)
	@$(pip-binary) \
		install \
			ansible==$(ansible-version)
