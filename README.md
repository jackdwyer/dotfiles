# dotfiles

## Dependencies
```bash
$ dnf install curl direnv dmenu feh git go i3 i3lock jq neovim nmap openvpn \
  python-virtualenv screen scrot ShellCheck terminus-fonts \
  the_silver_searcher tmux vagrant vlc weechat xclip xterm
```

## Installation
```bash
$ cd ${HOME} && git clone git@github.com:jackdwyer/dotfiles && cd dotfiles
$ make
$ source ~/.bashrc
```

## st
```bash
$ git clone git://git.suckless.org/st
$ cd st
$ cp ${HOME}/dotfiles/st/config.h .
$ make
$ mv st ${HOME}/bin/
```

## Post runs
### tweet
```bash
$ mkdir -p ${HOME}/.config/twitter/
```
Configure `${HOME}/.config/twitter/auth.conf`

TODO global git config
