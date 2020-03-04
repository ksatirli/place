###
#	Utilities
###
.PHONY uninstall-tools:
uninstall-tools: overview uninstall-ansible uninstall-brew reset-xcode

###
#	User-facing targets
###
.PHONY uninstall:
uninstall: uninstall-tools # Uninstalls Ansible, and Brew, and resets Xcode CLI Tools

.PHONY uninstall-ansible:
uninstall-ansible: # Uninstalls Ansible
	$(call has_required,$(pip-binary))

	$(info $(sign-place)  Uninstalling Ansible with `$(pip-binary)`)
	@$(pip-binary) \
		uninstall \
			ansible

.PHONY: uninstall-brew
uninstall-brew: check-for-brew # Uninstalls Brew
	$(info $(sign-place)  Uninstalling Brew)
	@$(ruby-binary) "$(base-directory)/$(brew-uninstaller-file)"

.PHONY reset-xcode:
reset-xcode: # Resets Xcode
	$(call has_required,xcode-select)

	$(info $(sign-place)  Resetting Xcode CLI Tools)
	$(info $(color-bright)$(sign-warning)  This operation requires root privilege$(color-off))
	@sudo xcode-select \
		--reset
