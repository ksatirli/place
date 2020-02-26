.PHONY install-npm-packages:
install-npm-packages: check-for-npm # installs global NPM Packages
ifeq ("$(wildcard $(npmfile))","")
	$(info $(sign-warning)  No npmfile available at $(npmfile))
	@exit 1
else
	$(info $(sign-place)  Installing global NPM Packages)
	@$(foreach package, $(shell cat "$(npmfile)"), \
		npm \
			install \
				--global "$(package)" \
	)
endif
