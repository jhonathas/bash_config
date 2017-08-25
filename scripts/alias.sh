alias ll="ls -Glahs"
alias ls="/bin/ls -G"
alias psgrep="ps aux | egrep -v egrep | egrep"
alias editzsh="emacs ~/.zsh.d/"
alias goemacs="cd ~/.emacs.d/"
alias editemacs="emacs ~/.emacs.d/"


# Elixir
alias mt="mix test"
alias mts="mix test --stale"
alias mtd="mix test.debug"
alias mtds="mix test.debug --stale"
alias mps="mix phx.server"
alias mted="MIX_ENV=test mix ecto.drop"
alias mdg="mix deps.get"

# Ruby
alias be="bundle exec"

# GIT
alias gs="git status"
alias gb="git branch"
alias gba="git branch -a"
alias gm="git merge --no-ff"
alias gpm="git push origin master"
alias gf="git fetch origin -p"
alias glog="git log --graph"
alias gpr="git pull --rebase"
alias gch="git checkout"

alias gffs="git flow feature start"
alias gfff="git flow feature finish"
alias gffp="git flow feature publish"
alias gfft="git flow feature track"

function gfc() {
  git checkout feature/$1
}

# ASDF
alias redis="redis-server . &"
alias postgres="pg_ctl start"
alias kpostgres="pg_ctl stop"

# React Native
alias rn="react-native"
