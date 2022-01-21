[[ -f ~/.Xresources ]] && xrdb -merge -I@HOME ~/.Xresources
xrandr --output DP-1 --auto --primary 
xrandr --output HDMI-1 --rotate right --mode 1920x1080 --rate 120.00 --left-of DP-1
xrandr --output DVI-D-2 --rotate right --mode 1920x1080 --right-of DP-1
exec bspwm
