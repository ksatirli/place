base-directory ?= $(HOME)/.cache/place
user-directory ?= $(HOME)/.config/place
brewfile ?= $(HOME)/.Brewfile
vscodeextensionsfile ?= $(HOME)/.VisualStudioCodeExtensions

color-off = $(shell tput sgr0)
color-bright = $(shell tput bold)
sign-place = 📍
sign-warning = ⚠️

ansible-binary ?= ansible-playbook
ansible-version ?= 2.9.4
extra-vars ?= user_directory=$(user-directory)
verbosity ?=

brew-base-url ?= https://raw.githubusercontent.com/Homebrew/install/master
brew-installer-url ?= $(brew-base-url)/install.sh
# TODO: update when https://github.com/Homebrew/install/issues/266 is closed and merged
brew-uninstaller-url ?= $(brew-base-url)/uninstall
brew-installer-file ?= brew-installer.sh
brew-uninstaller-file ?= brew-uninstaller
brew-prune-days ?= 1

pip-binary ?= pip3

ruby-binary = ruby
