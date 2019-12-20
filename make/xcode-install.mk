.PHONY xcode-install:
xcode-install: # installs Xcode
ifeq (, $(shell which xcode-select))
	$(error $(warning-sign)  xcode-select is not available in $$PATH))
endif

	@echo
	@echo "$(place-sign)  Starting Xcode CLI Tools Installer"
	@echo
	@-xcode-select \
		--install
	@echo