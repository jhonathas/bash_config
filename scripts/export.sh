PATH=/usr/local/heroku/bin:$PATH
export PATH=$PATH

export EDITOR="nano"

# brew/cask
# export HOMEBREW_CASK_OPTS="--caskroom=~/Applications"

# IONIC / CORDOVA
export JAVA_HOME=$(/usr/libexec/java_home)

# Using Android Studio path
export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

export PATH="/usr/local/sbin:$PATH"

export PATH=$(brew --prefix openssl)/bin:$PATH

export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"


# Node

export PATH="/Users/jhonathas/.asdf/installs/nodejs/8.9.1/.npm/bin:$PATH"
