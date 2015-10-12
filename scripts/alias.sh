alias ll="ls -Glahs"
alias ls="/bin/ls -G"
alias psgrep="ps aux | egrep -v egrep | egrep"
alias preview="open -a Preview"
alias gobash="cd ~/.bash.d/"

# alias to open repos
for repo in $(ls ~/src); do
  alias "r-$repo"="repo open $repo"
done

alias dkexec='dk exec -it "${PWD##*/}_web_1"'
alias rails="dkexec rails"
alias rake="dkc run --rm web rake"
alias dkc="docker-compose"
alias dkm="docker-machine"
alias dkbye="docker-machine stop docker"
alias dkstart="docker-machine start docker"
alias dknfs="docker-machine-nfs docker"
alias dkbash="docker-compose run --service-ports --rm web bash"
alias dkinit="dkstart && dknfs && reload"
alias dkexec='dk exec -it "${PWD##*/}_web_1"'

alias rails="dkexec rails"
alias rake="dkc run --rm web rake"
