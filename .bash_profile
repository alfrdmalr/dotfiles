#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc
if systemctl -q is-active graphical.target && [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  #exec startx
  echo 'not starting x session automatically; TODO reenable'
fi


if [ -e /home/lfre/.nix-profile/etc/profile.d/nix.sh ]; then . /home/lfre/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
