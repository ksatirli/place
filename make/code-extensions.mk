.PHONY code-extensions:
code-extensions: check-for-code # installs Visual Studio Code Extensions
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
