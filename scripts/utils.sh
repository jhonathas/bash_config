# reload source
reload() {
  source ~/.bash_profile;
}

see() {
  qlmanage -p "$@" &>/dev/null
}
