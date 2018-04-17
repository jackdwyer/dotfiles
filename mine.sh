alias ls='ls --color=auto'
alias l='ls --color=auto'
alias lock='i3lock -c 000000'
# alias v='nvim -u ~/.vim/vimrc'
# alias vi='nvim -u ~/.vim/vimrc'
# yalias vim='nvim -u ~/.vim/vimrc'

function rmssh() { sed -i "$1d" "$HOME"/.ssh/known_hosts; }

function d() {
  if [ -z "$1" ]; then
    cd ../; ls
  else
    cd "$1"; ls
  fi
}

function p() {
  if [[ ${1} == '-h' || ${1} == '--help' ]]; then
    echo "usage: p [OPTION]"
    echo " -a  only letters and digits"
    return
  fi
  if [[ ${1} == '-a' ]]; then
    cat /dev/urandom | tr -d -c [:alnum:] | head -c 35; echo
  else
    cat /dev/urandom | tr -d -c [:print:] | head -c 35; echo
  fi
}

function akcheck() {
  curl -v -H 'pragma: akamai-x-cache-on' -o /dev/null $1
}

function settings() {
  xfce4-settings-manager
}

function vc() {
  if [[ $1 == "-h" ]]; then
    echo "vc         python2"
    echo "vc 3       python36"
    return
  fi
  args=""
  if [[ $1 == 3 ]]; then
    args="-p $(which python36)"
  fi

  repo=$(basename $(pwd))

  if [[ -d "venv-${repo}" ]]; then
    source "venv-${repo}/bin/activate"
  else
    virtualenv ${args} "venv-${repo}"
    source "venv-${repo}/bin/activate"
  fi
}

GREP_OPTS='--exclude-dir=berks-cookboks'
function todos() {
  grep -rnIw ${GREP_OPTS} ./ -e "TODO" | grep -v '-e "TODO"'
}

test_http() {
  ENDPOINT=${1}
  HTTP_RESP=${2:-200}
  TIME_OUT=${3:-1}
  RED='\033[1;31m'
  RST='\033[0m'
  while :; do
    VAL=$(curl -s -o/dev/null -w "%{http_code}" "${ENDPOINT}")
    if [[ ${VAL} -eq "${HTTP_RESP}" ]]; then
      echo -n "."
    else
      printf " ${RED}FAIL ${VAL}${RST} "
    fi
    sleep ${TIME_OUT}s;
  done
}
