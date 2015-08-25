__wesolve_prompt () {
  # Colors
  local BLUE="\[\033[0;34m\]"
  local NO_COLOR="\[\e[0m\]"
  local GRAY="\[\033[1;30m\]"
  local GREEN="\[\033[0;32m\]"
  local LIGHT_GRAY="\[\033[0;37m\]"
  local LIGHT_GREEN="\[\033[1;32m\]"
  local LIGHT_RED="\[\033[1;31m\]"
  local RED="\[\033[0;31m\]"
  local WHITE="\[\033[1;37m\]"
  local YELLOW="\[\033[0;33m\]"
  local PURPLE="\[\033[0;35m\]"
  local BASE_COLOR="$NO_COLOR"

  # Branch
  local BRANCH=`git branch 2> /dev/null | grep \* | sed 's/* //'`

  if [[ "$BRANCH" = "" ]]; then
    BRANCH=`git status 2> /dev/null | grep "On branch" | sed -E 's/^.*On branch //'`
  fi

  if [[ "$BRANCH" = "" ]]; then
    BRANCH=" $BRANCH"
  fi

  # Elixir version
  local ELIXIR_VERSION=""
  local ELIXIR_PROMPT=""

  if [ -f mix.exs ]; then
    ELIXIR_VERSION=`elixir -e "IO.puts System.version"`

    # if [ -f mix.lock ]; then
    #   local PHOENIX_VERSION=`mix run -e "IO.puts elem(:application.get_key(:phoenix, :vsn), 1)"`
    # fi

    if [[ "$PHOENIX_VERSION" ]]; then
      local PHOENIX_PROMPT=", phoenix: ${PHOENIX_VERSION}"
    fi

    ELIXIR_PROMPT="${PURPLE}elixir: ${ELIXIR_VERSION}${PHOENIX_PROMPT}${NO_COLOR}"
  fi

  # Ruby version
  local RUBY_VERSION=""
  local RUBY_PROMPT=""

  if [ -f Gemfile ]; then
    RUBY_VERSION=`ruby -e "puts RUBY_VERSION"`

    if [ -f Gemfile.lock ]; then
      local RAILS_VERSION=`cat Gemfile.lock | grep -E " +rails \([0-9]+" | sed 's/ *rails (\(.*\))/\1/'`
    fi

    if [[ "$RAILS_VERSION" ]]; then
      local RAILS_PROMPT=", rails: ${RAILS_VERSION}"
    fi

    RUBY_PROMPT="${RED}ruby: ${RUBY_VERSION}${RAILS_PROMPT}${NO_COLOR}"
  fi

  # Current language
  local LANG_PROMPT=""

  if [ "$ELIXIR_PROMPT" != "" ]; then
    LANG_PROMPT="${ELIXIR_PROMPT}"
  elif [ "$RUBY_PROMPT" != "" ]; then
    LANG_PROMPT="${RUBY_PROMPT}"
  fi

  local STATUS=`git status 2> /dev/null | tr "\\n" " "`
  local PROMPT_COLOR=""
  local STATE=" "
  local NOTHING_TO_COMMIT="# Initial commit"
  local BEHIND="Your branch is behind"
  local AHEAD="Your branch is ahead"
  local UNTRACKED="Untracked files"
  local DIVERGED="have diverged"
  local CHANGED="Changed but not updated"
  local TO_BE_COMMITED="Changes to be committed"
  local CHANGES_NOT_STAGED="Changes not staged for commit"
  local LOG=`git log -1 2> /dev/null`

  if [ "$STATUS" != "" ]; then
    if [[ "$STATUS" =~ "$CHANGES_NOT_STAGED" ]]; then
      PROMPT_COLOR="${RED}"
      STATE=""
    elif [[ "$STATUS" =~ "$NOTHING_TO_COMMIT" ]]; then
      PROMPT_COLOR="${RED}"
      STATE=""
    elif [[ "$STATUS" =~ "$DIVERGED" ]]; then
      PROMPT_COLOR="${RED}"
      STATE="${STATE}${RED}↕${NO_COLOR}"
    elif [[ "$STATUS" =~ "$BEHIND" ]]; then
      PROMPT_COLOR="${RED}"
      STATE="${STATE}${RED}↓${NO_COLOR}"
    elif [[ "$STATUS" =~ "$AHEAD" ]]; then
      PROMPT_COLOR="${RED}"
      STATE="${STATE}${RED}↑${NO_COLOR}"
    elif [[ "$STATUS" =~ "$CHANGED" ]]; then
      PROMPT_COLOR="${RED}"
      STATE=""
    elif [[ "$STATUS" =~ "$TO_BE_COMMITED" ]]; then
      PROMPT_COLOR="${RED}"
      STATE=""
    else
      PROMPT_COLOR="${GREEN}"
      STATE=""
    fi

    if [[ "$STATUS" =~ "$UNTRACKED" ]]; then
      STATE="${STATE}${YELLOW}*${NO_COLOR}"
    fi

    PS1="\n${BASE_COLOR}\w\a${NO_COLOR} ${PROMPT_COLOR}${BRANCH}${NO_COLOR}${STATE}${NO_COLOR} ${LANG_PROMPT}\n\$ "
  else
    PS1="\n${BASE_COLOR}\w\a${NO_COLOR} ${LANG_PROMPT}\n\$ "
  fi
}

PROMPT_COMMAND=__wesolve_prompt
