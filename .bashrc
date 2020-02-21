# set wallpaper directory
export WALLPAPER_HOME=~/images/wallpapers

# source aliases
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# source scripts
if [ -d ~/scripts/bash ]; then
  for f in ~/scripts/bash/*; do source $f; done
fi    
