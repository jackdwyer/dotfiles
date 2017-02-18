# dotfiles

## Dependencies
```bash
$ dnf install git xterm the_silver_searcher xclip scrot tmux i3 dmenu i3lock vagrant neovim direnv curl go jq weechat python-virtualenv openvpn nmap ShellCheck feh terminus-fonts screen
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
