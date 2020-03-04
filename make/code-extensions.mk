.PHONY code-extensions:
code-extensions: # Installs Visual Studio Code Extensions
	$(call has_required,code)

ifeq ("$(wildcard $(vscodeextensionsfile))","")
	$(info $(sign-warning)  No vscodeextensionsfile available at $(vscodeextensionsfile))
	@exit 1
else
	$(info $(sign-place)  Installing Visual Studio Code Extensions)
	@$(foreach extension, $(shell cat "$(vscodeextensionsfile)"), \
		code \
			--force \
			--install-extension "$(extension)" \
	)
endif
