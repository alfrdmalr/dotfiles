# set wallpaper directory
export WALLPAPER_HOME=~/wallpapers

# list all the images in the wallpapers directory 
get-wallpapers() {
  ls $WALLPAPER_HOME 
}  

# use input image to set colorscheme
set-colorscheme() {
  wal -n -i ${1:-$WALLPAPER_HOME/`get-wallpapers | dmenu`} 
}

# use input image to set colorscheme
set-wallpaper() {
  feh --bg-fill --no-xinerama ${1:-$WALLPAPER_HOME/`get-wallpapers | dmenu`} 
}

# set wallpaper and colorscheme at once
set-theme() {
  wal -n -i ${1:-$WALLPAPER_HOME/`get-wallpapers | dmenu`} 
  feh-fill "$(< "${HOME}"/.cache/wal/wal)"
}

# source aliases
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi
