# dotfiles

## Dependencies
```bash
$ dnf install git xterm the_silver_searcher xclip scrot tmux i3 dmenu i3lock vagrant neovim direnv curl go jq
$ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```

# Installation
```bash
$ cd
$ git clone git@github.com:jackdwyer/dotfiles
$ cd dotfiles
$ ./install.sh
$ source ~/.bashrc
$ vim -c VundleInstall +qall
```

## Post runs
### tweet
create ini configuration at `${HOME}/.config/twitter/auth.conf`
