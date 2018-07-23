# dotfiles
## Contents
1. [Setup](#setup)
    - [Fedora](#fedora)
        - YouCompleteMe(#youcompleteme)
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
$ dnf install at curl direnv dmenu feh git go i3 i3lock inotify-tools jq \
  libX11-devel libXft-devel neovim nmap openvpn python-virtualenv screen \
  scrot ShellCheck sshfs terminus-fonts the_silver_searcher tmux vagrant vlc \
  volumeicon weechat xclip xorg-x11-proto-devel xterm
$ pip install --user neovim flake8
```

### YouCompleteMe
[https://github.com/Valloric/YouCompleteMe#fedora-linux-x64](Fedora YouCompleteMe Installation Instructions)

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
```

### minimal
```
$ make
$ source ~/.bashrc
```

### Full 
includes st & i3
```
$ make phat
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
Disable autohide in fullscreen

via: [about:config](about:config)
```
browser.fullscreen.autohide FALSE
```

Disable Password manager -> [about:preferences#privacy](about:preferences#privacy)

## Post
### tweet
```bash
$ mkdir -p ${HOME}/.config/twitter/
```
Configure `${HOME}/.config/twitter/auth.conf`
[https://twitter.com/isjackalive](https://twitter.com/isjackalive)

## TODOS
[] global git config

## Dependencies
 - https://github.com/VundleVim/Vundle.vim
