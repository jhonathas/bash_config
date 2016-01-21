alias ll="ls -Glahs"
alias ls="/bin/ls -G"
alias psgrep="ps aux | egrep -v egrep | egrep"
alias preview="open -a Preview"
alias gobash="cd ~/.bash.d/"

# alias to open repos
for repo in $(ls ~/src); do
  alias "r-$repo"="repo open $repo"
done

alias dk='docker'
alias dkc="docker-compose"
alias dkm="docker-machine"

alias dkcleaner="dk images -q --filter \"dangling=true\" | xargs docker rmi -f"

alias dkmstart="docker-machine start dev"
alias dkmstop="docker-machine stop dev"
alias dkminit="dkstart && dknfs && reload"
alias dkmnfs="docker-machine-nfs dev"

alias dkcrun='docker-compose run --rm web'
alias dkcbash="dkcrun bash"
alias dkcbashs="docker-compose run --service-ports --rm web bash"

alias rails="dkcrun bundle exec rails"
alias rake="dkcrun bundle exec rake"
