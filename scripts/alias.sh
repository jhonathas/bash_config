alias ll="ls -Glahs"
alias ls="/bin/ls -G"
alias psgrep="ps aux | egrep -v egrep | egrep"
alias gobash="cd ~/.bash.d/"
alias goemacs="cd ~/.emacs.d/"

# alias to open repos
for repo in $(ls ~/src); do
  alias "r-$repo"="repo open $repo"
done

for repo in $(ls ~/src/persisto); do
  alias "r-$repo"="repo open $repo"
done

for repo in $(ls ~/src/bunker); do
  alias "r-$repo"="repo open $repo"
done

for repo in $(ls ~/src/pessoal); do
  alias "r-$repo"="repo open $repo"
done
