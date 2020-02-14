[[ -f ~/.Xresources ]] && xrdb -merge -I@HOME ~/.Xresources
~/.fehbg &
wal -i "$(< "${HOME}/.cache/wal/wal")" -n
unclutter --timeout 2 &
exec i3
