ansible-binary ?= ansible
ansible-version ?= 2.9.2
ansible-verbosity ?=

brew-base-url ?= "https://raw.githubusercontent.com/Homebrew/install/master"
brew-installer-url ?= $(brew-base-url)/install
brew-uninstaller-url ?= $(brew-base-url)/uninstall
brew-installer-file ?= "brew-installer-$(timestamp).rb"
brew-uninstaller-file ?= "brew-uninstaller-$(timestamp).rb"

color-off = \033[0m
color-mute = \033[0;37m
color-bright = \033[1;37m

pip-binary ?= pip3

place-directory ?= $(HOME)/.config/my-place
place-sign = 📍

timestamp := $(shell date +'%Y%m%d_%H%M')

user ?= $(USER)

warning-sign = ⚠️