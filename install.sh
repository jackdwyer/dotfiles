#!/bin/bash

OPT="$1"

usage() {
    echo "./$(basename $0) <all>"
}

status() {
    echo "[ $1 ] $2"
}

echo -n "Flushed Redis: "; redis-cli -n 15 flushall

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DOTFILE_BACKUP=$HOME/.dotfile_backups
BACKUP_LOC=$DOTFILE_BACKUP/$(date --iso-8601)

# folders
mkdir $HOME/{tools,programming} &> /dev/null

log() {
  if [[ $DEBUG ]]; then echo "[info] $@"; fi
}

backup_loc() {
    log "Creating $BACKUP_LOC"
    mkdir -p $BACKUP_LOC/{vim,}
}

install_file_list() {
  # must pass file folder with the key; look at the bash list for an example
  local FILE_LIST="$@"
  for f in $FILE_LIST; do
    pushd $HOME &> /dev/null
      if [[ -f ".$f" ]]; then
        backup_loc
        log "mv .$f to $BACKUP_LOC"
        mv ".$f" $BACKUP_LOC/$f
      fi
      log "Creating symlink for $f"
      ln -sf "$DIR"/$f $HOME/.$f &> /dev/null
    popd &> /dev/null
  done
}

link_this() {
  local target=$1
  local link=$2
  
  if [[ -f "$link" ]]; then
    backup_loc
    log "mv $link to $BACKUP_LOC"
    mv "$link" $BACKUP_LOC/
  fi
  if [[ -L "$link" ]]; then
    unlink "$link"
  fi
  ln -sf "$target" "$link" &> /dev/null

  # ln -sf "$DIR/i3" $HOME/.i3 &> /dev/null
}


# general
GENERALFILES=( inputrc Xresources )
log $GENERALFILES
install_file_list "${GENERALFILES[*]}"

# bash
BASHFILES=( bash/bashrc )
install_file_list $BASHFILES

# vim
VIMFILES=( vim/vimrc )
install_file_list $VIMFILES

# tmux
status "tmux" "linking .tmux.conf"
link_this "$DIR/tmux/tmux.conf" $HOME/.tmux.conf

# i3
link_this "$DIR/i3" $HOME/.i3

# dunst
link_this "$DIR/dunst/dunstrc" $HOME/.config/dunstrc



if [[ "$OPT"  == 'all' ]]; then
    log "running vundle"
    vim_out=$(vim -c +VundleInstall +qall)
    echo $vim_out
fi

# load in cronjobs
crontab "$DIR/cron/jobs"

# force cronjobs to run
log 'Calling cronjobs'
echo 'calling cronjobs, to populate with data'
cat $DIR/cron/jobs | cut -d" " -f6- | bash -


# things not tracked
NOTTRACKEDFILES=( .ssh/config .secrets bash/site-functions.sh )

echo -n "Reminder ->"
usage
echo "done"

# INSTALLTYPE="home"

# if [ "$INSTALLTYPE" == "home" ]; then
#   mkdir $HOME/programming
# fi

# mkdir "$HOME/bin"

# ## vim stuff
# ln -s $HOME/dotfiles/vim/ftplugin ftplugin
# ln -s $HOME/dotfiles/vim/ftdetect ftdetect

# # tmux stuff
# ln -s $HOME/dotfiles/tmux.con $HOME/.tmux.conf

# # Vundle
# git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# # screenlayout stuff
# ln -s dotfiles/screenlayout .screenlayout
