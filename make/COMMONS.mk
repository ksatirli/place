define has_required
	$(if $(shell which $(1)),,$(error Unable to continue due to missing dependency `$(1)` in $$PATH))
endef

.SILENT .PHONY: clear
clear:
	clear

.SILENT .PHONY: help
help: overview # Displays this help text
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
	$(info $(color-bright)brewfile:$(color-off)         $(brewfile))
	$(info $(color-bright)base directory:$(color-off)	  $(base-directory))
	$(info $(color-bright)user directory:$(color-off)	  $(user-directory))

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
open-base-directory: # Opens Place base directory
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
open-user-directory: # Opens Place User configuration directory
	@open "$(user-directory)"

.PHONY check-for-ansible:
check-for-ansible:
	$(call has_required,$(ansible-binary))

.PHONY check-for-brew:
check-for-brew:
	$(call has_required,$(ruby-binary))

	$(call has_required,brew)
