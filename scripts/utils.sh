# reload source
reload() {
  source ~/.bash_profile;
}

_repo() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=( $(compgen -W "$(ls ~/src)" -- $cur) )
}

repo() {
  cd ~/src/$1
}

complete -F _repo repo

see() {
  qlmanage -p "$@" &>/dev/null
}
