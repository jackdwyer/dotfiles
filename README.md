# dotfiles

## Dependencies
```bash
$ dnf install curl direnv dmenu feh git go i3 i3lock inotify-tools jq \
  libX11-devel libXft-devel neovim nmap openvpn python-virtualenv screen \
  scrot ShellCheck sshfs terminus-fonts the_silver_searcher tmux vagrant vlc \
  volumeicon weechat xclip xorg-x11-proto-devel xterm
```

## Installation
```bash
$ cd ${HOME} && git clone git@github.com:jackdwyer/dotfiles && cd dotfiles
$ make
$ source ~/.bashrc
```

## Post runs
### tweet
```bash
$ mkdir -p ${HOME}/.config/twitter/
```
Configure `${HOME}/.config/twitter/auth.conf`


## TODOS
[] global git config
