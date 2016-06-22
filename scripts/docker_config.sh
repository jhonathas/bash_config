alias dk='docker'
alias dkc="docker-compose"
alias dkm="docker-machine"

alias dkcleaner="dk images -q --filter \"dangling=true\" | xargs docker rmi -f"

alias dkmstart="dkm start develop"
alias dkmstop="dkm stop develop"
alias dkmnfs="docker-machine-nfs develop"
alias dkminit="dkmstart && dkmnfs && eval \"$(dkm env develop)\""

alias dkrun='dkc run --rm web'
alias dkbash="dkrun bash"
alias dkbashs="dkc run --service-ports --rm web bash"


# Ruby alias to user Docker
alias rake="dkrun bundle exec rake"

function rails() {
    if [[ $@ == "s" ]]; then
				command docker-compose run --service-ports --rm web bundle exec rails s -b 0.0.0.0
    else
        command docker-compose run --rm web bundle exec rails "$@"
    fi
}
