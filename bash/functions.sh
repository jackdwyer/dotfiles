nt() {
  if [[ "$#" -eq 0 ]]; then
    notify-send $(basename $(pwd))
    return
  fi
  notify-send "$*"
}

remove_line_ssh() { sed -i "$1d" "$HOME"/.ssh/known_hosts; }
alias rmssh=remove_line_ssh

function d() {
  if [ -z "$1" ]; then
    cd ../; ls
  else
    cd "$1"; ls
  fi
}

# git functions
git_fast_commit() { git commit  "$1" -m "$2"; }
git_diff() { git diff "$1"; }
git_get_missing_commits() { cat /tmp/.commit_repo; }

alias gg=git_fast_commit
alias gd=git_diff
alias gi=git_get_missing_commits
alias gt='git status'

# tmux so i reconnect to same session
t() {
  tmux attach -t default_session || tmux new -s default_session
}

function be() { [[ ("$1" = "a") || ("$1" = "an") ]] && shift; bundle exec "$@"; }

vc () {
  repo=$(basename $(pwd))
  if [[ -d "venv-$repo" ]]; then
    source "venv-$repo/bin/activate"
  else
    virtualenv "venv-$repo"
    source "venv-$repo/bin/activate"
  fi
}

# straight from: http://superuser.com/questions/611538/is-there-a-way-to-display-a-countdown-or-stopwatch-timer-in-a-terminal
countdown() {
  date1=$((`date +%s` + $1)); 
  while [ "$date1" -ge `date +%s` ]; do 
    echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
    sleep 0.1
  done
}

akcheck() {
  curl -v -H 'pragma: akamai-x-cache-on' -o /dev/null $1
}
