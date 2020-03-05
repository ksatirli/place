.PHONY docker:
docker: # Pulls Docker Images
	@$(ansible-binary) \
		--extra-vars="$(extra-vars)" \
		--tags="docker" \
		$(verbosity) \
		"ansible/main.yml"
