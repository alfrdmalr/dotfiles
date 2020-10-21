[[ -f ~/.Xresources ]] && xrdb -merge -I@HOME ~/.Xresources
xrandr --output DVI-D-1 --rotate right
~/.fehbg &
wal -n -R
unclutter --timeout 2 &
picom -b --experimental-backends &
exec i3
