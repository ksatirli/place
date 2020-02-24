.SILENT .PHONY: clear
clear:
	clear

.SILENT .PHONY: help
help: overview # displays this help text
	@echo
	@echo -e	"$(color-bright)OPTIONS$(color-off)"

	grep \
		--context=0 \
		--devices=skip \
		--extended-regexp \
		--no-filename \
			"(^[a-z-]+){1}: ?(?:[a-z-])* #" $(MAKEFILE_LIST) | \
	awk 'BEGIN {FS = ":.*?# "}; {printf "  \033[1m  %s\033[0m;%s\n", $$1, $$2}' | \
	column -c2 -s ";" -t
	@echo

.PHONY: overview
overview:
	@echo
	@echo -e "$(color-bright)$(sign-place)  Place.$(color-mute)"
	@echo
	@echo
	@echo	-e "$(color-bright)CONFIGURATION$(color-off)"
	@echo -e "    $(color-bright)user:$(color-off)              $(user)"
	@echo -e "    $(color-bright)home:$(color-off)              $(base-directory)"
	@echo -e "    $(color-bright)brewfile:$(color-off)          $(brewfile)"
	@echo -e "    $(color-bright)npmfile:$(color-off)           $(npmfile)"

ifdef only-tags
	@echo -e "    $(color-bright)only-tags:$(color-off)         $(only-tags)"
endif

ifdef skip-tags
	@echo -e "    $(color-bright)skip-tags:$(color-off) 	       $(skip-tags)"
endif

ifdef verbosity
	@echo -e "    $(color-bright)verbosity:$(color-off) 	      $(verbosity)"
endif

ifdef ansible-binary
	@echo -e "    $(color-bright)ansible-binary:$(color-off)    $(ansible-binary)"
endif

ifdef pip-binary
	@echo -e "    $(color-bright)pip-binary:$(color-off)        $(pip-binary)"
endif

create-config-directory:
# In most runs, this target will not actually have to create $(base-directory),
# as the target would be executed, in a normal flow, with the very first run.
	@mkdir -p "$(base-directory)"

.PHONY: open-config-directory
open-config-directory:
# In most runs, this target will not actually have to create $(base-directory),
# as the target would be executed, in a normal flow, with the very first run.
	@open "$(base-directory)"

remove-config-directory:
	@echo
	@echo "$(sign-place)  Removing config directory \`$(base-directory)\`"
	@echo
	@rm -irv "$(base-directory)"
