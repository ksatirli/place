.PHONY install-ansible:
install-ansible: check-for-pip # installs Ansible
	$(info $(sign-place)  Installing Ansible with `$(pip-binary)`)
	@$(pip-binary) \
		install \
			ansible==$(ansible-version)
