.PHONY npm-install-packages:
npm-install-packages: # installs global NPM Packages
ifeq ($(shell which npm 2>/dev/null 2>&1; echo $$?), 1)
	$(info $(sign-warning)  npm is not available in $$PATH)
	$(info Consider running make npm-install)
	@exit 1
else ifeq ("$(wildcard $(npmfile))","")
	$(info $(sign-warning)  No npmfile available at $(npmfile))
	@exit 1
else
	$(info )
	$(info $(sign-place)  Installing global NPM Packages)
	$(info )
	@$(foreach package, $(shell cat "$(npmfile)"), \
		npm \
			install \
				--global "$(package)" \
	)
endif
