# 📍 Place

> Provision macOS environments through code

## Table of Contents

- [Place](#-place)
  - [Table of Contents](#table-of-contents)
  - [Requirements](#requirements)
  - [Usage](#usage)
    - [Installing Packages](#installing-packages)
    - [Setting macOS Defaults](#setting-macos-defaults)
    - [Syncing Dotfiles](#syncing-dotfiles)
  - [Notes](#notes)
  - [Author Information](#author-information)
  - [License](#license)

## Requirements

- macOS
- a (moderately) up-to-date copy of Git.
- a compatible set of [configuration files](https://github.com/ksatirli/dotfiles/tree/master/.config/place)

## Usage

- Create a local clone of the [Place repository](https://github.com/operatehappy/place):

```sh
git clone "git@github.com:operatehappy/place.git" "${HOME}/.place"
```

- Create an alias for `place` in your Bash configuration (usually `.bashrc` or `.bash_profile`):

```sh
alias place="make --file ${HOME}/.place/Makefile"
```

- Reload your Bash configuration and verify `place` is available

After reloading your Bash configuration, verify everything works by running `place overview`:

```sh
📍  Place.

CONFIGURATION

brewfile:         /Users/operatehappy/.Brewfile
base directory:   /Users/operatehappy/.cache/place
user directory:   /Users/operatehappy/.config/place
```

- Install Xcode CLI Tools, Brew and Ansible:

```sh
place install
```

The Xcode CLI Tools, `brew`, and `ansible` can also be installed separately:

- `place xcode` to install Xcode CLI Tools
- `place brew` to install Brew
- `place ansible` to install Ansible

## Installing Packages

- Install Brew Packages, Taps, Casks and App Store applications (using `mas`) defined in your `Brewfile`:

```sh
place brewfile
```

Brew-managed packages, applications, and casks can be managed through:

- `place brew-update` to update Brew
- `place brew-upgrade` to upgrade Brew packages
- `place brew-upgrade-casks` to update Brew Casks
- `place brew-outdated` to list outdated Brew packages
- `place brew-clean` to clean up cached Brew files

## Additional Package Managers

In addition to `Brewfile` support, _Place_ also can install `gem`, `npm`, and `pip` packages as well as VS Code extensions, respectively:

- `place gem` for Ruby Gems defined in `~/.config/place/ruby-gems.yml`
- `place npm` for NPM packages defined in `~/.config/place/npm-packages.yml`
- `place pip` for pip packages defined in `~/.config/place/pip-packages.yml`
- `place code-extensions` for Visual Studio Code extensions defined in `~/.VisualStudioCodeExtensions`

## Setting macOS Defaults

_Place_ supports rapidly setting large amounts of macOS Defaults:

- `place defaults` for Defaults defined in `~/.config/place/macos-defaults.yml`

A default configuration for `macos-defaults.yml` could look like this:

```yaml
---
  macos_defaults:
      - # auto-hide Dock
        domain: "com.apple.dock"
        key: "autohide"
        type: "bool"
        value: "true"
        state: present

  macos_defaults_targets:
    - Dock
```

Each _Default_ is a child item of `macos_defaults` and must contain at least:

- `domain`
- `key`
- `value`

The keys `subkey`, `type`, and `state` are optional

Any applications that require a restart for _Defaults_ to be applied can be listed in `macos_defaults_targets`.

## Syncing Dotfiles

_Place_ supports syncing your (remote) Dotfiles:

- `place dotfiles` for Dotfiles configuration defined in `~/.config/place/dotfiles.yml`

A default configuration for `dotfiles.yml` could look like this:

```yaml
---

  repository: "git@github.com:ksatirli/dotfiles.git"
  source_directory: "{{ lookup('env','HOME') }}/.dotfiles"
  destination_directory: "{{ lookup('env','HOME') }}/"
  excludes_file: "{{ lookup('env','HOME') }}/.dotfiles/.config/rsync/excludes"
```

Internally, _Place_ will `git clone` the repository specified in `dotfiles.yml` and then `rsync` any files in `source_directory` with `destination_directory`.

## Notes

- _Place_ has a large number of additional options available, these can be found through `place help`

- _Place_ supports in-line configuration for the three base variables `brewfile`, `base-directory` and `user-directory`
  - `place brewfile=~/.alternate-Brewfile brewfile` to set the `Brewfile` location to `~/.alternate-Brewfile`
  - `place base-directory=~/.place-home install` to set the base directory to `~/.place-home`
  - `place user-directory=~/.place-user install` to set the user directory to `~/.place-user`

The options for `base-directory` and `user-directory` are ephemeral and need to be set with _every_ Place CLI option (e.g.: `install`, `brew`, `ansible` etc.).

_ Additional configuration options can be found in `make/CONFIG.mk`

## Author Information

This module is maintained by the contributors listed on [GitHub](https://github.com/operatehappy/place/graphs/contributors)

Development of this module was sponsored by [Operate Happy](https://github.com/operatehappy).

## License

Licensed under the Apache License, Version 2.0 (the "License").

You may obtain a copy of the License at [apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an _"AS IS"_ basis, without WARRANTIES or conditions of any kind, either express or implied.

See the License for the specific language governing permissions and limitations under the License.
