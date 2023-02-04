[[ -f ~/.Xresources ]] && xrdb -merge -I@HOME ~/.Xresources
#exec xmonad
exec bspwm
