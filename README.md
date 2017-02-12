# dotfiles

## Dependencies
```bash
$ dnf install git xterm the_silver_searcher xclip scrot tmux i3 dmenu i3lock vagrant neovim direnv curl go jq weechat python-virtualenv openvpn nmap ShellCheck feh terminus-fonts
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
$ curl -s -o ${HOME}/bin/geoip https://raw.githubusercontent.com/jackdwyer/geoip/master/geoip.sh && chmod +x ${HOME}/bin/geoip
```

## Installation
```bash
$ cd
$ git clone git@github.com:jackdwyer/dotfiles
$ cd dotfiles
$ ./install.sh
$ source ~/.bashrc
$ vim -c VundleInstall +qall
```

## st
```bash
$ git clone git://git.suckless.org/st
$ cd st
$ cp ${HOME}/st/config.h .
$ make
$ mv st ${HOME}/bin/
```

## Post runs
### tweet
create ini configuration at `${HOME}/.config/twitter/auth.conf`

[*] TODO add to PS1 if ssh
TODO global git config
