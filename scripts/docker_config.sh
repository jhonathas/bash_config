function docker-machine-init() {
    if [ `docker-machine status` == "Running" ]; then
        eval "$(docker-machine env)"
    fi
}

docker-machine-init

alias dk='docker'
alias dkc="docker-compose"
alias dkm="docker-machine"

alias dkcleaner="dk images -q --filter \"dangling=true\" | xargs docker rmi -f"

alias dkmstart="dkm start"
alias dkmstop="dkm stop"
alias dkmnfs="docker-machine-nfs default"
alias dkminit="dkmstart && dkmnfs && docker-machine-init"
alias dkmrestart="dkmstop && dkminit"

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

function ruby() {
    if [[ $@ == *"-Itest"* ]]; then
        command docker-compose run --rm web ruby "$@"
    else
        command ruby "$@"
    fi
}

function mix() {
    if [[ $@ == "phoenix.server" ]]; then
        command docker-compose run --service-ports --rm web mix phoenix.server
    else
        command docker-compose run --rm web mix "$@"
    fi
}

function ember() {
    if [[ $@ == "s" ]]; then
        command ember s --proxy http://docker:4000/api
    else
        command ember "$@"
    fi
}

alias iex="command docker-compose run --rm web iex"
