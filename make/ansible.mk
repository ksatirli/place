.PHONY ansible:
ansible: # Installs Ansible
	$(call has_required,$(pip-binary))

	$(info $(sign-place)  Installing Ansible with `$(pip-binary)`)
	@$(pip-binary) \
		install \
			ansible==$(ansible-version)
