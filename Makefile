# Makefile for Chair

###
 # configuration
###
.DEFAULT_GOAL := help

# colorize some of the output, see http://dcmnt.me/1XYnkPe for more information
COLOR_OFF = \x1b[0m
COLOR_OK = \x1b[32;01m
COLOR_ERR = \x1b[31;01m
COLOR_MUTE = \x1b[30;01m
COLOR_BRIGHT = \x1b[37;01m

SIGN_OK = $(COLOR_OK)  ✓$(COLOR_OFF)
SIGN_ERR = $(COLOR_ERR)  ✗$(COLOR_OFF)
SIGN_CHAIR="💺 "

TIMESTAMP := $(shell date +'%Y%m%d_%H%M%S')

DIR_CHAIR=/Users/$(USER)/.chair

BREW_URL_BASE=https://raw.githubusercontent.com/Homebrew/install/master
BREW_URL_INSTALLER=$(BREW_URL_BASE)/install
BREW_URL_UNINSTALLER=$(BREW_URL_BASE)/uninstall
BREW_FILE_INSTALLER="brew-installer-$(TIMESTAMP).rb"
BREW_FILE_UNINSTALLER="brew-uninstaller-$(TIMESTAMP).rb"

# runtime variable `user`, accepts setting via Make arg and, if empty, defaults to currently logged-in user
user =

ifndef user
	user = $(USER)
endif

EXTRA_VARS_USER=user=$(user)
# end: runtime variable `user`

# runtime variable `profile`, accepts setting via Make arg and, if empty, defaults to empty string
profile =

ifndef profile
	profile = "n/a"
	EXTRA_VARS_PROFILE=
else
	EXTRA_VARS_PROFILE=profile=$(profile)
endif
# end: runtime variable `profile`

# runtime variable `skip-tags`, accepts setting via Make arg and, if empty, defaults to empty string
skip-tags =

ifndef skip-tags
	skip-tags = "n/a"
	ANSIBLE_ARG_SKIP_TAGS=
else
	ANSIBLE_ARG_SKIP_TAGS=--skip-tags=$(skip-tags)
endif
# end: runtime variable `skip-tags`

# runtime variable `verbosity`, accepts setting via Make arg and, if empty, defaults to empty string
verbosity =

ifndef verbosity
	verbosity = "n/a"
	ANSIBLE_ARG_VERBOSITY=
else
	ANSIBLE_ARG_VERBOSITY=-$(verbosity)
endif
# end: runtime variable `verbosity`

# Ansible-specific variables
ANSIBLE_BINARY = ansible-playbook
ANSIBLE_VAULT_FILE = "./config/users/$(user)/ansible-vault"
ANSIBLE_ARG_EXTRA_VARS = --extra-vars="$(EXTRA_VARS_USER) $(EXTRA_VARS_PROFILE)"
ANSIBLE_ARG_VAULT_FILE = --vault-password-file=$(ANSIBLE_VAULT_FILE)


###
 # Targets
###
.PHONY: help
help:
	@echo "$(COLOR_BRIGHT)"
	@echo "     _____   _               _        		"
	@echo "    / ____| | |             (_)       		"
	@echo "   | |      | |__     __ _   _   _ __ 		"
	@echo "   | |      | '_ \   / _\` | | | | '__|	"
	@echo "   | |____  | | | | | (_| | | | | |   		"
	@echo "    \_____| |_| |_|  \__,_| |_| |_|   		"
	@echo "                                      		"
	@echo "    $(COLOR_BRIGHT)Prep your machine using Ansible and Homebrew.$(COLOR_MUTE)"
	@echo
	@echo	"$(COLOR_BRIGHT)   Configuration:$(COLOR_OFF)"
	@echo "     user:     		$(user)"
	@echo "     profile:  		$(profile)"
	@echo "     skip-tags: 	$(skip-tags)"
	@echo
	@echo	"$(COLOR_BRIGHT)   available Arguments:$(COLOR_OFF)"
	@echo "     user: $(COLOR_MUTE).........................$(COLOR_OFF) sets the username to work with"
	@echo "     profile: $(COLOR_MUTE)......................$(COLOR_OFF) sets the profile to work with"
	@echo "     extra-vars: $(COLOR_MUTE)...................$(COLOR_OFF) sets the extra Ansible vars to add"
	@echo "     skip-tags: $(COLOR_MUTE)....................$(COLOR_OFF) sets the Ansible tags to skip"
	@echo
	@echo	"$(COLOR_BRIGHT)   Targets:$(COLOR_OFF)"
	@echo "     make chair $(COLOR_MUTE).............,......$(COLOR_OFF) installs Xcode CLI tools, Homebrew and Ansible"
	@echo "     make chair-install $(COLOR_MUTE)............$(COLOR_OFF) installs Xcode CLI tools, Homebrew and Ansible"
	@echo "     make chair-cleanup $(COLOR_MUTE)............$(COLOR_OFF) installs Xcode CLI tools, Homebrew and Ansible"
	@echo
	@echo	"$(COLOR_BRIGHT)   Helper Targets:$(COLOR_OFF)"
	@echo
	@echo "     make help $(COLOR_MUTE).....................$(COLOR_OFF) displays this help screen"
	@echo "     make install $(COLOR_MUTE)..................$(COLOR_OFF) installs Xcode CLI tools, Homebrew and Ansible"
	@echo "     make uninstall $(COLOR_MUTE)................$(COLOR_OFF) uninstalls Xcode CLI tools, Homebrew and Ansible"
	@echo "     make xcode-install $(COLOR_MUTE)............$(COLOR_OFF) installs Xcode CLI tools"
	@echo "     make brew-install $(COLOR_MUTE).............$(COLOR_OFF) installs Homebrew"
	@echo "     make brew-uninstall $(COLOR_MUTE)...........$(COLOR_OFF) uninstalls Homebrew"
	@echo "     make brew-update $(COLOR_MUTE)..............$(COLOR_OFF) updates Homebrew to latest version"
	@echo "     make brew-upgrade $(COLOR_MUTE).............$(COLOR_OFF) upgrades Homebrew Casks and packages to latest version"
	@echo "     make ansible-install $(COLOR_MUTE)..........$(COLOR_OFF) installs Ansible"
	@echo "     make ansible-uninstall $(COLOR_MUTE)........$(COLOR_OFF) uninstalls Ansible"
	@echo "     make ansible-install-roles $(COLOR_MUTE)....$(COLOR_OFF) installs Ansible Role(s)"
	@echo


.PHONY: install
install: chair-install xcode-install brew-install ansible-install


.PHONY: uninstall
uninstall: brew-uninstall ansible-uninstall


.PHONY: chair
chair:
	@echo
	@echo "$(SIGN_CHAIR) Building your Chair"
	@echo

ifeq ($(shell which ansible-playbook >/dev/null 2>&1; echo $$?), 1)
	@echo "$(SIGN_ERR) unable to find Ansible."
	@echo
	@echo "  Try running $(COLOR_BRIGHT)\`make ansible-install\`$(COLOR_OFF)"
	@echo
	@exit 1
else
	@$(ANSIBLE_BINARY) \
		$(ANSIBLE_ARG_EXTRA_VARS) \
		$(ANSIBLE_ARG_SKIP_TAGS) \
		$(ANSIBLE_ARG_VERBOSITY) \
		playbooks/main.yml
endif


.PHONY: chair-install
chair-install:
	@echo
	@echo "$(SIGN_CHAIR) Creating Chair directory"
	@mkdir -p "$(DIR_CHAIR)"
	@echo


.PHONY: chair-cleanup
chair-cleanup:
	@echo
	@echo "$(SIGN_CHAIR) Cleaning up Chair directory"
	@-rm \
		-rf \
			$(DIR_CHAIR)/brew-*installer-*.rb
	@echo


.PHONY: xcode-install
xcode-install:
	@echo
	@echo "$(SIGN_CHAIR) Starting Xcode CLI Tools Installer..."
	@echo
	@-xcode-select \
		--install


.PHONY: brew-install
brew-install:
	@echo
	@echo "$(SIGN_CHAIR) Fetching Homebrew Installer..."
	@echo

	@curl \
		--silent \
		--location \
		--output $(DIR_CHAIR)/$(BREW_FILE_INSTALLER) \
		$(BREW_URL_INSTALLER)

	@ruby "$(DIR_CHAIR)/$(BREW_FILE_INSTALLER)"


.PHONY: brew-uninstall
brew-uninstall:
	@echo
	@echo "$(SIGN_CHAIR) Fetching Homebrew Uninstaller..."
	@echo

	@curl \
		--silent \
		--location \
		--output $(DIR_CHAIR)/$(BREW_FILE_UNINSTALLER) \
		$(BREW_URL_UNINSTALLER)

	@ruby "$(DIR_CHAIR)/$(BREW_FILE_UNINSTALLER)"


.PHONY: brew-update
brew-update:
	@echo
	@echo "$(SIGN_CHAIR) Updating Homebrew..."
	@echo

ifeq ($(shell which brew >/dev/null 2>&1; echo $$?), 1)
	@echo "$(SIGN_ERR) unable to find Homebrew."
	@echo
	@echo "  Try running $(COLOR_BRIGHT)\`make brew-install\`$(COLOR_OFF)"
	@echo
	@exit 1
else
ifeq ($(shell which ansible-playbook >/dev/null 2>&1; echo $$?), 1)
	@echo "$(SIGN_ERR) unable to find Ansible."
	@echo
	@echo "  Try running $(COLOR_BRIGHT)\`make ansible-install\`$(COLOR_OFF)"
	@echo
	@exit 1
else
	@$(ANSIBLE_BINARY) \
		$(ANSIBLE_ARG_EXTRA_VARS) \
		$(ANSIBLE_ARG_SKIP_TAGS) \
		$(ANSIBLE_ARG_VERBOSITY) \
		playbooks/update-homebrew.yml
endif
endif


.PHONY: brew-upgrade
brew-upgrade:
	@echo
	@echo "$(SIGN_CHAIR) Upgrading Homebrew..."
	@echo

ifeq ($(shell which brew >/dev/null 2>&1; echo $$?), 1)
	@echo "$(SIGN_ERR) unable to find Homebrew."
	@echo
	@echo "  Try running $(COLOR_BRIGHT)\`make brew-install\`$(COLOR_OFF)"
	@echo
	@exit 1
else
ifeq ($(shell which ansible-playbook >/dev/null 2>&1; echo $$?), 1)
	@echo "$(SIGN_ERR) unable to find Ansible."
	@echo
	@echo "  Try running $(COLOR_BRIGHT)\`make ansible-install\`$(COLOR_OFF)"
	@echo
	@exit 1
else
	@$(ANSIBLE_BINARY) \
		$(ANSIBLE_ARG_EXTRA_VARS) \
		$(ANSIBLE_ARG_SKIP_TAGS) \
		$(ANSIBLE_ARG_VERBOSITY) \
		playbooks/upgrade-homebrew.yml
endif
endif


.PHONY: ansible-install
ansible-install:
	@echo
	@echo "$(SIGN_CHAIR) Installing Ansible..."

	@brew \
		install \
			ansible


.PHONY: ansible-uninstall
ansible-uninstall:
	@echo
	@echo "$(SIGN_CHAIR) Uninstalling Ansible..."
	@echo

	@brew \
		uninstall \
			ansible


.PHONY: ansible-install-roles
ansible-install-roles:
	@echo
	@echo "$(SIGN_CHAIR) Installing Ansible Roles..."

ifeq ($(shell which ansible-playbook >/dev/null 2>&1; echo $$?), 1)
	@echo "$(SIGN_ERR) unable to find Ansible."
	@echo
	@echo "  Try running $(COLOR_BRIGHT)\`make ansible-install\`$(COLOR_OFF)"
	@echo
	@exit 1
else
	@$(ANSIBLE_BINARY) \
		$(ANSIBLE_ARG_EXTRA_VARS) \
		$(ANSIBLE_ARG_SKIP_TAGS) \
		$(ANSIBLE_ARG_VERBOSITY) \
		playbooks/install-ansible-roles.yml
endif
