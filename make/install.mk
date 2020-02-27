###
#	Utilities
###
.PHONY install-tools:
install-tools: overview xcode brew postinstall-brew ansible # installs Xcode CLI Tools, Brew, and Ansible

###
#	User-facing targets
###
.PHONY install:
install: install-tools # installs Xcode CLI Tools, Brew, and Ansible
