alias ll="ls -Glahs"
alias ls="/bin/ls -G"
alias psgrep="ps aux | egrep -v egrep | egrep"
alias preview="open -a Preview"

# alias to open repos
for repo in $(ls ~/src); do
  alias "r-$repo"="repo open $repo"
done

alias dkc="docker-compose"
alias dkm="docker-machine"
alias dkbye="docker-machine stop docker"
alias dk="docker"
alias dkstart="docker-machine start docker && reload"
alias dknfs="docker-machine-nfs docker"
alias dkbash="docker-compose run --service-ports --rm web bash"
alias dkup="dkstart && dknfs && dkbash"

alias rails="dkc run --rm web rails"
alias rake="dkc run --rm web rake"
