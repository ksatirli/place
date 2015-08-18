# Chair

Instantly prepare your local OS X-based environment using [Ansible](http://www.ansible.com/home) and [Homebrew](http://brew.sh/).

# Installation

## Prerequisites

### Install Ansible roles

`chair` makes use of a number of Ansible roles that can be automatically downloaded from the [Galaxy](https://galaxy.ansible.com/) as well as Github.

In order to install these roles, execute `make install-roles`.

*Note:* Due to the way Ansible is written, the playbook depends upon a `command` task which executes the `ansible-galaxy` binary. This task is not idempotent and will overwrite any local changes to the `roles` directory on every run.

You should only need to (re-)install roles on first launch and / or whenever you updated `./config/user/roles.yml`

# Credits
https://github.com/ymendel/dotfiles/blob/master/osx/


https://github.com/ymendel/dotfiles/blob/master/osx/input.defaults
https://github.com/ymendel/dotfiles/blob/master/osx/locale.defaults
https://github.com/ymendel/dotfiles/blob/master/osx/mission_control.defaults
