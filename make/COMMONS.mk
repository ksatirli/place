.SILENT .PHONY: clear
clear:
	clear

.SILENT .PHONY: help
help: overview # displays this help text
	$(info )
	$(info $(color-bright)OPTIONS$(color-off))
	grep \
		--context=0 \
		--devices=skip \
		--extended-regexp \
		--no-filename \
			"(^[a-z-]+):{1} ?(?:[a-z-])* #" $(MAKEFILE_LIST) | \
	awk 'BEGIN {FS = ":.*?# "}; {printf "\033[1m%s\033[0m;%s\n", $$1, $$2}' | \
	column \
		-c2 \
		-s ";" \
		-t
	$(info )

.PHONY: overview
overview:
	$(info $(color-bright)$(sign-place)  Place.$(color-off))
	$(info )
	$(info )
	$(info $(color-bright)CONFIGURATION$(color-off))
	$(info )
	$(info $(color-bright)user:$(color-off)             $(user))
	$(info $(color-bright)brewfile:$(color-off)         $(brewfile))
	$(info $(color-bright)base directory:$(color-off)	  $(base-directory))
	$(info $(color-bright)user directory:$(color-off)	  $(user-directory))
	$(info )

ifdef skip-tags
	$(info $(color-bright)skip-tags:$(color-off)        $(skip-tags))
endif

ifdef verbosity
	$(info $(color-bright)verbosity:$(color-off)        $(verbosity))
endif

ifdef ansible-binary
	$(info $(color-bright)ansible-binary:$(color-off)   $(ansible-binary))
endif

ifdef pip-binary
	$(info $(color-bright)pip-binary:$(color-off)       $(pip-binary))
endif
	$(info )
	@exit 0

create-config-directory:
# In most runs, this target will not actually have to create $(base-directory),
# as the target would be executed, in a normal flow, with the very first run.
	@mkdir \
		-p "$(base-directory)"

.PHONY: open-base-directory
open-base-directory:
# In most runs, this target will not actually have to create $(base-directory),
# as the target would be executed, in a normal flow, with the very first run.
	@open "$(base-directory)"

remove-base-directory:
	$(info $(sign-place)  Removing config directory \`$(base-directory)\`)
	@rm \
		-i \
		-r \
		-v \
			"$(base-directory)"

.PHONY: open-user-directory
open-user-directory:
	@open "$(user-directory)"

.PHONY check-for-ansible:
check-for-ansible:
ifeq ($(shell which $(ansible-binary) 2>/dev/null 2>&1; echo $$?), 1)
	$(info $(sign-warning)  $(ansible-binary) is not available in $$PATH)
	@exit 1
endif

.PHONY check-for-brew:
check-for-brew: check-for-ruby
ifeq ($(shell which brew 2>/dev/null 2>&1; echo $$?), 1)
	$(info $(sign-warning)  brew is not available in $$PATH)
	$(info Consider running make brew-install)
	@exit 1
endif

.PHONY check-for-code:
check-for-code:
ifeq ($(shell which code 2>/dev/null 2>&1; echo $$?), 1)
	$(info $(sign-warning)  code is not available in $$PATH)
	@exit 1
endif

.PHONY check-for-curl:
check-for-curl:
ifeq ($(shell which curl 2>/dev/null 2>&1; echo $$?), 1)
	$(info $(sign-warning)  curl is not available in $$PATH)
	@exit 1
endif

.PHONY check-for-pip:
check-for-pip:
ifeq ($(shell which $(pip-binary) 2>/dev/null 2>&1; echo $$?), 1)
	$(info $(sign-warning)  $(pip-binary) is not available in $$PATH)
	@exit 1
endif

.PHONY check-for-ruby:
check-for-ruby:
ifeq ($(shell which $(ruby-binary) 2>/dev/null 2>&1; echo $$?), 1)
	$(info $(sign-warning)  $(ruby-binary) is not available in $$PATH)
	@exit 1
endif

.PHONY check-for-xcode-select:
check-for-xcode-select:
ifeq ($(shell which curl 2>/dev/null 2>&1; echo $$?), 1)
	$(info $(sign-warning)  xcode-select is not available in $$PATH)
	@exit 1
endif
