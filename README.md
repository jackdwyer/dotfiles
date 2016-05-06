# dotfiles

# WM tooling
- i3lock
`dnf install i3lock`

# Third Party Tools
- ag 
`dnf install the_silver_searcher`

- xterm
`dnf install xterm`

- python-virtualenv
`dnf install python-virtualenv`

- keychain
`dnf install keychain`

- dunst
`dnf remove xfce4-notifyd`
`dnf install dunst`

- redis
`dnf install redis`
`system enable redis`
`system start redis`

- jq https://stedolan.github.io/jq/
`curl -L -o $HOME/bin/jq https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64 && chmod +x $HOME/bin/jq`

- geoip https://github.com/jackdwyer/geoip
`curl -L -o $HOME/bin/geoip https://raw.githubusercontent.com/jackdwyer/geoip/master/geoip.sh && chmod +x $HOME/bin/geoip`

- xclip https://github.com/astrand/xclip
`dnf install xclip`

- scrot https://en.wikipedia.org/wiki/Scrot | homepage not loading
`dnf install scrot`

- direnv http://direnv.net/
`cd $HOME; git clone https://github.com/direnv/direnv tools/direnv`
`cd tools/direnv`
`make`
`ln -s $HOME/tools/direnv/direnv $HOME/bin/`

- s3-screenshot https://github.com/jackdwyer/s3-screenshot
`cd $HOME; git clone git@github.com:jackdwyer/s3-screenshot.git tools/s3-screenshot`
`ln -s $HOME/tools/s3-screenshot/screenshot.sh $HOME/bin/screenshot`

- awscli https://aws.amazon.com/cli/
`pip install --user awscli`

- vagrant https://www.vagrantup.com/downloads.html
`dnf install vagrant`

- vundle
`git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim`

- weechat
`dnf install weechat`

- tmux
`dnf install tmux`

# TODO: do I want this?
# # basic test suite
# - (bats)[https://github.com/sstephenson/bats]
# ```bash
# git clone git@github.com:sstephenson/bats.git $HOME/tools/bats
# sudo $HOME/tools/bats/install.sh /usr/local/
# 
# ```

# i3 has hardcoded $HOME/dotfiles/bin


## testing thirdparty tools
# NOT WORKING
- volumeicon > dont think its needed

- handling brightness (maybe)
https://github.com/haikarainen/light
- dependencies:
  - gcc
  - help2man

- to install
  dnf install help2man gcc
  git clone https://github.com/haikarainen/light
  make

# manual
ssh config
ssh keys

# flake8 and all linters get em working good

### cool tools
websocketd https://github.com/joewalnes/websocketd
