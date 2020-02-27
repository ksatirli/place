.PHONY uninstall-ansible:
uninstall-ansible: check-for-piip # uninstalls Ansible
	$(info $(sign-place)  Uninstalling Ansible with `$(pip-binary)`)
	@$(pip-binary) \
		uninstall \
			ansible
