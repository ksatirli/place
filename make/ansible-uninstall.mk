.PHONY ansible-uninstall:
ansible-uninstall: # uninstalls Ansible
	@echo
	@echo "$(place-sign) Uninstalling Ansible with \`$(pip-binary)\`"
	@echo
	@$(pip-binary) \
		uninstall \
			ansible
	@echo