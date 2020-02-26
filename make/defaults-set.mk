.PHONY set-defaults:
set-defaults: # Sets macOS Defaults
ifeq ("$(wildcard $(defaultsfile))","")
	$(info $(sign-warning)  No Defaultsfile found at $(defaultsfile))
	@exit 1
else

endif
