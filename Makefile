.DEFAULT_GOAL := help

help:
	@echo "     _____   _               _        "
	@echo "    / ____| | |             (_)       "
	@echo "   | |      | |__     __ _   _   _ __ "
	@echo "   | |      | '_ \   / _\` | | | | '__|"
	@echo "   | |____  | | | | | (_| | | | | |   "
	@echo "    \_____| |_| |_|  \__,_| |_| |_|   "
	@echo "                                      "
	@echo "    Prep your machine using Ansible."
	@echo
	@echo	"    Options:"
	@echo "      install		-- installs Homebrew and Ansible and runs playbooks"
	@echo "      install-roles	-- installs Ansible roles"
	@echo "      update		-- updates Homebrew to latest version"
	@echo "      upgrade		-- upgrades Homebrew packages to latest version"

install-homebrew:
	@#ruby -e "$$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	@#echo "install-homebrew"

install-ansible:
	@#brew install ansible
	@#echo "install-ansible"

	install-ansible-head:
		@ansible-playbook \
			playbooks/install-ansible-head.yml \

install-ansible-roles:
	@ansible-playbook \
		playbooks/install-ansible-roles.yml \

install-osx-defaults:
	@ansible-playbook \
		playbooks/install-osx-defaults.yml

run-playbooks:
	@ansible-playbook \
		playbooks/install-homebrew-applications.yml \
		playbooks/install-homebrew-casks.yml \
		playbooks/install-node-modules.yml \
		playbooks/install-atom-packages.yml \
		playbooks/install-pip-packages.yml

.PHONY: install
install: install-homebrew install-ansible run-playbooks install-osx-defaults


.PHONY: install-roles
install-roles: install-ansible-roles


.PHONY: update
update:
	@ansible-playbook \
		playbooks/update-homebrew.yml


.PHONY: upgrade
upgrade:
	@ansible-playbook \
		playbooks/upgrade-homebrew.yml
