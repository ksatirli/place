base-directory ?= $(HOME)/.cache/place
user-directory ?= $(HOME)/.config/place
brewfile ?= $(HOME)/.Brewfile
dotfiles ?= $(HOME)/.dotfiles
dotfiles_repository ?= git@github.com:$(user)/dotfiles.git
dotfiles_excludes ?= $(dotfiles)/.config/rsync/excludes
npmfile ?= $(HOME)/.npmfile
vscodefile ?= $(HOME)/.VisualStudioCodeExtensions

color-off = $(shell tput sgr0)
color-mute = $(shell tput dim)
color-bright = $(shell tput bold)
sign-place = 📍
sign-warning = ⚠️

ansible-binary ?= ansible-playbook
ansible-version ?= 2.9.4
extra-vars ?= user_directory=$(user-directory)
only-tags ?=
skip-tags ?=
verbosity ?=

brew-base-url ?= https://raw.githubusercontent.com/Homebrew/install/master
brew-installer-url ?= $(brew-base-url)/install
brew-uninstaller-url ?= $(brew-base-url)/uninstall
brew-installer-file ?= brew-installer-$(timestamp).rb
brew-uninstaller-file ?= brew-uninstaller.rb
brew-prune-days ?= 1

pip-binary ?= pip3

ruby-binary = ruby

timestamp := $(shell date +'%Y%m%d_%H%M')

user ?= $(USER)
