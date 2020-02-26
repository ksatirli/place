.PHONY ansible-uninstall:
ansible-uninstall: # uninstalls Ansible
ifeq ($(shell which $(pip-binary) >/dev/null 2>&1; echo $$?), 1)
	$(info $(sign-warning)  $(pip-binary) is not available in $$PATH)
	$(info Consider running make pip-install)
	@exit 1
else
	$(info $(sign-place)  Uninstalling Ansible with `$(pip-binary)`)
	@$(pip-binary) \
		uninstall \
			ansible
endif
