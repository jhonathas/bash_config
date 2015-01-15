# reload source
reload() {
  source ~/.bash_profile;
}

_repo() {
  local cur prev opts
  COMPREPLY=()
  cur="${COMP_WORDS[COMP_CWORD]}"
  prev="${COMP_WORDS[COMP_CWORD-1]}"
  opts="clone list open path remove new"

  case "${prev}" in
    o|open)
      local repos=$(ls ~/src)
      COMPREPLY=( $(compgen -W "${repos}" -- ${cur}) )
      return 0
      ;;
    rm|remove)
      local repos=$(ls ~/src)
      COMPREPLY=( $(compgen -W "${repos}" -- ${cur}) )
      return 0
      ;;
    *)
    ;;
  esac

  if [[ "$COMP_CWORD" == 1 ]]; then
    COMPREPLY=($(compgen -W "${opts}" -- ${cur}))
  fi

  return 0
}

#  repo path
#  repo list
#  repo new
#  repo open [repo_name]
#  repo remove [repo_name]
#  repo clone [git_endpoint]
repo() {
  case "$1" in
    path)
      echo "$HOME/src"
      return 0
      ;;
    l|ls|list)
      \ls -1 ~/src
      return 0
      ;;
    o|open)
      cd ~/src/$2
      return 0
      ;;
		n|new)
		  mkdir -p ~/src/$2
			repo o $2
			return 0
			;;
    rm|remove)
      if [[ "$2" != '' ]]; then
        read -r -p "Remove repo $2? [yes/no] " response
        case $response in
          [yY][eE][sS])
            rm -rf ~/src/$2
            echo "Repo $2 removed."
            ;;
          *)
          ;;
        esac
      fi
      return 0
      ;;
    c|clone)
      cd ~/src
      git clone $2 $3
      local repo
      if [[ "$3" != '' ]]; then
        repo="$3"
      else
        if [[ "$2" =~ \/(.*)\.git$ ]]; then
          repo="${BASH_REMATCH[1]}"
        fi
      fi
      echo "New repo $repo."
      return 0
      ;;
    *)
    ;;
  esac
}

complete -F _repo repo

see() {
  qlmanage -p "$@" &>/dev/null
}
