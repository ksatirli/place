# Chair

Prepare your local OS X-based environment using [Ansible](http://www.ansible.com/home) and [Homebrew](http://brew.sh/).

## Prerequisites

`Chair` requires a recently up-to-date copy of [Git](https://git-scm.com/). You are all set for this if your OS X is _10.9_ or higher.

# Installation

Clone this [Git repository](https://bitbucket.org/ksatirli/chair):

```
# with SSH keys:
git clone git@bitbucket.org:ksatirli/chair.git

# with username and password:
git clone https://username@bitbucket.org/ksatirli/chair.git
```

Once done, change into the directory you cloned `Chair` into and attempt to run it by executing the `make` command.

The output should look something like this:

```
     _____   _               _        		
    / ____| | |             (_)       		
   | |      | |__     __ _   _   _ __ 		
   | |      | '_ \   / _` | | | | '__|
   | |____  | | | | | (_| | | | | |   		
    \_____| |_| |_|  \__,_| |_| |_|   		

    Prep your machine using Ansible and Brew.

   Configuration:
     user:     		<your username>
     profile:  		n/a
     skip-tags: 	n/a
```

When run through the `make` command, without any specific _targets_, `Chair` will output the help section. This section is also available via `make help` and lists configuration options as well as available arguments and targets.

For the initial run, execute `make install` to install the Xcode CLI tools as well as [Homebrew](http://brew.sh/) and a recent copy of [Ansible](http://www.ansible.com/).

Please note: if you already have one of the three tools installed already, you can specifically install the (missing) prerequisites using one of the following:

* `make xcode-install` to _only_ install Xcode CLI tools
* `make brew-install` to _only_ install Homebrew
* `make ansible-install` to _only_ install Ansible 2.x

# Usage

`Chair` uses a `Makefile` to simplify running of various commands. In order to _build_ your `Chair`, you would run `make chair`.

If your _group_, _team_ or _organization_ has used `Chair` before, it is likely that you have a _profile_ available. Using these profiles is as easy as setting the `user` variable on a run like so:

```
make chair user=acme-developers
```

Regardless of the user profile passed, `Chair` will look for a (fitting) user profile inside the `config/users` directory. Any of the currently supported types (Homebrew CLI and GUI applications, PIP packages, Atom packages, NPM packages, OS X defaults) will be updated as needed.

Keep in mind that `Chair` may need to download large amounts of data. As such, it is best to run `Chair` when you are not on a mobile data connection.

# Credits

`Chair` was initially created by [Kerim Satirli](https://www.linkedin.com/in/kerimsatirli) with input from [Yury Liavitski](https://www.linkedin.com/in/yuryliavitski).

The project has its inspiration in Github's [Boxen](https://github.com/boxen/our-boxen/#our-boxen) but foregos the heavyweight _Puppet_ set up for a more light-weight, YAML-based approach.

The logo is based on content from [Noun Project](https://thenounproject.com/term/office-chair/301938/) made by Giuditta Valentina Gentile. It was modified by [Jades Paulus](https://dribbble.com/Jades/).

https://github.com/ymendel/dotfiles/blob/master/osx/
https://github.com/ymendel/dotfiles/blob/master/osx/input.defaults
https://github.com/ymendel/dotfiles/blob/master/osx/locale.defaults
https://github.com/ymendel/dotfiles/blob/master/osx/mission_control.defaults
