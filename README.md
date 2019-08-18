# dotfiles
## Contents
1. [Setup](#setup)
    - [Fedora](#fedora)
        - [YouCompleteMe](#youcompleteme)
        - [volumeicon](#volumeicon)
    - [Windows/Linux Subsystem](#windowslinux-subsystem)
2. [Installation](#installation)
    - [Minimal](#minimal)
    - [Full](#full)
3. [Post](#post)
    - [Tweet](#tweet)
4. [Dropbox](#dropbox)
6. [Firefox](#firefox)
6. [TODOs](#todos)
7. [Dependencies](#dependencies)


## Setup
### Fedora
```bash
$ dnf install at arandr curl direnv dmenu feh git go i3 i3lock inotify-tools jq \
  libX11-devel libXft-devel neovim nmap openvpn patch python-virtualenv screen \
  scrot ShellCheck sshfs terminus-fonts the_silver_searcher tmux vagrant \
  volumeicon weechat xclip xorg-x11-proto-devel xterm
$ pip install --user neovim flake8
```

### YouCompleteMe
[https://github.com/Valloric/YouCompleteMe#fedora-linux-x64](https://github.com/Valloric/YouCompleteMe#fedora-linux-x64)

#### volumeicon
Preferences -> Status Icons -> Left Mouse Button | Show Silder

### Windows/Linux Subsystem
#### caps2esc
Double click on `windows/caps2esc.reg`, accept changes to registry

#### Beeps/Bells/Notifications
Start menu > `control panel` > Hardware and Sounds > Change system sounds

Set all of these to `none`

- Device Connect
- Device Disconnect
- Device Failed to Connect
- Exclamation
- Instant Message Notification
- Low Battery Alarm
- Message Nudge
- Notification
- System Notification
> Wtf Microsoft?

#### neovim
[https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu](https://github.com/neovim/neovim/wiki/Installing-Neovim#ubuntu)

#### software
```bash
apt-get install curl direnv git inotify-tools jq nmap openvpn \
                python-virtualenv screen tmux vagrant \
                silversearcher-ag weechat
```

## Installation
```
$ cd ${HOME} && git clone git@github.com:jackdwyer/dotfiles && cd dotfiles
$ make
$ make vim
$ make st
$ source ~/.bashrc
```
## Dropbox
Install via: [https://www.dropbox.com/install-linux](https://www.dropbox.com/install-linux)
```bash
TMPFILE=$(mktemp)
crontab -l > ${TMPFILE}
echo "@reboot ${HOME}/.dropbox-dist/dropboxd" >> ${TMPFILE}
crontab ${TMPFILE}
ln -s ${HOME}/Dropbox/vimwiki ${HOME}/vimwiki
```

## Firefox
[about:config](about:config)
```
browser.fullscreen.autohide FALSE
# Disable autohide in fullscreen
ui.key.menuAccessKeyFocuse FALSE
# disables alt from showing menu bar
```
### Plugins
- [uBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/)
- [Vimium-FF](https://addons.mozilla.org/en-US/firefox/addon/vimium-ff/)
- [Firefox Multi-Account Containers](https://addons.mozilla.org/en-US/firefox/addon/multi-account-containers/)


#### General
##### Applications

`mailto` to `Always Ask` 

##### Browsing
DISABLE `Recommend extensions as you browse`
DISABLE `Recommend features as you browse`

#### Home
Firefox Home Content only as `Top Sites :: 4 Rows`

#### Search
Default Search Engine : `DuckDuckGo`
Disable `Provide search suggestions`

Remove all `One-Click Search Engines` except for `DuckDuckGo`

#### Privacy & Security
Content Blocking -- ENABLE `Strict`

Cookies and Site Data -- ENABLE `Delete cookies and site data when Firefox is closed`

Login and Passwords -- Disable `Ask to save logins and passwords for websites`

#### Address Bar
Disable all suggestions

#### Permissions
Disable ALL
Block ALL NEW REQUESTS

#### Firefox Data Collection and Use
DISABLE ALL


## Pass
[Pass](https://www.passwordstore.org/)

Import Key
```
gpg2 --import <key>
gpg2 --edit-key <key id>
> trust
```

Clone pass store to `${HOME}/.password-store`


## Post
### tweet
```bash
$ mkdir -p ${HOME}/.config/twitter/
```
Configure `${HOME}/.config/twitter/auth.conf`
[https://twitter.com/isjackalive](https://twitter.com/isjackalive)


## Dependencies
 - https://github.com/VundleVim/Vundle.vim
