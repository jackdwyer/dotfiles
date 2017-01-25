#!/bin/bash
# set -euo pipefail

DOT_DIR=${HOME}/dotfiles

mkdir ${HOME}/{bin,programming,.i3} &> /dev/null ||

ln -s ${DOT_DIR}/bash/bashrc ${HOME}/.bashrc
ln -s ${DOT_DIR}/inputrc ${HOME}/.inputrc
ln -s ${DOT_DIR}/tmux.conf ${HOME}/.tmux.conf
ln -s ${DOT_DIR}/vimrc ${HOME}/.vimrc
ln -s ${DOT_DIR}/Xresources ${HOME}/.Xresources
ln -s ${DOT_DIR}/.i3/config ${HOME}/.i3/config
