.PHONY vscode-install-extensions:
vscode-install-extensions: # installs Visual Studio Code Extensions
ifeq ($(shell which code 2>/dev/null 2>&1; echo $$?), 1)
	$(info $(sign-warning)  code is not available in $$PATH)
	$(info Consider installing Visual Studio Code)
	@exit 1
else ifeq ("$(wildcard $(vscodefile))","")
	$(info $(sign-warning)  No vscodefile available at $(vscodefile))
	@exit 1
else
	$(info )
	$(info $(sign-place)  Installing Visual Studio Code Extensions)
	$(info )
	@$(foreach extension, $(shell cat "$(vscodefile)"), \
		code \
			--force \
			--install-extension "$(extension)" \
	)
endif
