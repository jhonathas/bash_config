PATH=/usr/local/heroku/bin:$PATH
export PATH=$PATH

export EDITOR="nano"

# brew/cask
# export HOMEBREW_CASK_OPTS="--caskroom=~/Applications"

# IONIC / CORDOVA
export JAVA_HOME=$(/usr/libexec/java_home)

export ANT_HOME=/usr/local/opt/ant
export MAVEN_HOME=/usr/local/opt/maven
export GRADLE_HOME=/usr/local/opt/gradle

# Using Android Studio path
export ANDROID_HOME=~/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools

# export PYTHONHOME=/usr/local/lib/python3.6
# export PYTHONPATH=/usr/local/lib/python3.6

export PATH="/usr/local/sbin:$PATH"

export PATH=$(brew --prefix openssl)/bin:$PATH

export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
