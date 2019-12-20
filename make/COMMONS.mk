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
