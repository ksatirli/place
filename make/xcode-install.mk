.PHONY xcode-install:
xcode-install: # installs Xcode
ifeq ($(shell which xcode-select >/dev/null 2>&1; echo $$?), 1)
	$(info $(sign-warning)  xcode-select is not available in $$PATH)
	@exit 1
else
	$(info $(sign-place)  Starting Xcode CLI Tools Installer)
	@-xcode-select \
		--install
endif
