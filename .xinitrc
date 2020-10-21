[[ -f ~/.Xresources ]] && xrdb -merge -I@HOME ~/.Xresources
~/.fehbg &
wal -n -R
unclutter --timeout 2 &
picom -b --experimental-backends &
exec i3
