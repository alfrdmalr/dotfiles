#
# ~/.bash_profile
#

# environment
# set wallpaper directory
export WALLPAPER_HOME=~/images/wallpapers
export HISTSIZE=10000
# allow dotfiles in fzf
export FZF_DEFAULT_COMMAND='rg --files .'

#android emulation/flutter
#export JAVA_OPTS='-XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee'
export JAVA_HOME='/usr/lib/jvm/java-11-openjdk'
export ANDROID_SDK_ROOT='/opt/android-sdk'

# sdkmanager root
PATH=$PATH:/opt/android-sdk/tools/bin
PATH=$PATH:/home/lfre/projects/flutter/bin
PATH=$PATH:/home/lfre/.nix-profile/bin

#ngrok
PATH=$PATH:/home/lfre/dev/ngrok

[[ -f ~/.bashrc ]] && . ~/.bashrc
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

if [ -e /home/lfre/.nix-profile/etc/profile.d/nix.sh ]; then . /home/lfre/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
