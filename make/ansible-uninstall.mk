.PHONY ansible-uninstall:
ansible-uninstall: check-for-pip # uninstalls Ansible
	$(info $(sign-place)  Uninstalling Ansible with `$(pip-binary)`)
	@$(pip-binary) \
		uninstall \
			ansible
