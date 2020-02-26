.PHONY install-code-extensions:
install-code-extensions: check-for-code # installs Visual Studio Code Extensions
ifeq ("$(wildcard $(vscodefile))","")
	$(info $(sign-warning)  No vscodefile available at $(vscodefile))
	@exit 1
else
	$(info $(sign-place)  Installing Visual Studio Code Extensions)
	@$(foreach extension, $(shell cat "$(vscodefile)"), \
		code \
			--force \
			--install-extension "$(extension)" \
	)
endif
