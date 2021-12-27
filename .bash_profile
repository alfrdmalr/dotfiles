#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

#
#environment variables
#

#android emulation/flutter
#export JAVA_OPTS='-XX:+IgnoreUnrecognizedVMOptions --add-modules java.se.ee'
export JAVA_HOME='/usr/lib/jvm/java-8-openjdk'
export ANDROID_SDK_ROOT='/opt/android-sdk'

# sdkmanager root
PATH=$PATH:/opt/android-sdk/tools/bin
