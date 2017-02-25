#!/bin/bash
# set -euo pipefail

DOT_DIR=${HOME}/dotfiles

function log_info() {
  echo "[INFO] ${1}"
}

function make_link() {
  _source=${1}
  _target=${2}

  if [[ -f "${_target}" ]]; then
    bak_destination="${_target}_$(date -I).bak"
    log_info "Moving ${_target} -> ${bak_destination}"
    mv ${_target} ${bak_destination}
  fi
  if ! [[ -L "${_target}" ]]; then
    ln -s ${_source} ${_target}
  else
    log_info "${_source} already symlink"
  fi
}

make_link "${DOT_DIR}/bash/bashrc" "${HOME}/.bashrc"
make_link "${DOT_DIR}/inputrc" "${HOME}/.inputrc"
make_link "${DOT_DIR}/tmux.conf" "${HOME}/.tmux.conf"
make_link "${DOT_DIR}/vimrc" "${HOME}/.vim/vimrc"
make_link "${DOT_DIR}/Xresources" "${HOME}/.Xresources"
make_link "${DOT_DIR}/i3/config" "${HOME}/.i3/config"

touch "${DOT_DIR}/work.sh"
touch "${DOT_DIR}/secrets.sh"

# function revert() {
#     mv "${_source}_$(date -I).bak" ${_source} 
# }
