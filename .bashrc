# set wallpaper directory
export WALLPAPER_HOME=~/images/wallpapers
export HISTSIZE=10000
# allow dotfiles in fzf
export FZF_DEFAULT_COMMAND='rg --files .'

# use wal theme on new terminals
cat ~/.cache/wal/sequences

# source aliases
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# source local (secret) aliases
if [ -f ~/.bash_local_aliases ]; then
  source ~/.bash_local_aliases
fi

# source scripts
if [ -d ~/scripts/bash ]; then
  for f in ~/scripts/bash/*; do source $f; done
fi

#
## development  
#

# source node version manager
source /usr/share/nvm/init-nvm.sh

#android emulation/flutter
#export JAVA_OPTS='-XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee'
export JAVA_HOME='/usr/lib/jvm/java-11-openjdk'
export ANDROID_SDK_ROOT='/opt/android-sdk'

# sdkmanager root
PATH=$PATH:/opt/android-sdk/tools/bin
PATH=$PATH:/home/lfre/projects/flutter/bin
PATH=$PATH:/home/lfre/.nix-profile/bin

PATH=$PATH:/home/lfre/dev/ngrok
