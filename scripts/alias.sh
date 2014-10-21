alias ll="ls -Glahs"
alias ls="/bin/ls -G"
alias psgrep="ps aux | egrep -v egrep | egrep"
alias preview="open -a Preview"

# alias to open repos
for repo in $(ls ~/src); do
  alias "r-$repo"="repo open $repo"
done
