# set wallpaper directory
export WALLPAPER_HOME=~/wallpapers

# set wallpaper and colorscheme at once
set-theme() {
  local IMG=`wallpaper-path-helper $@`
  if [ ! -z $IMG ]
    then wal -n -i $IMG
         set-wallpaper "$(< "${HOME}"/.cache/wal/wal)"
  fi
}

# source aliases
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# source scripts
if [ -d ~/scripts/bash ]; then
  for f in ~/scripts/bash/*; do source $f; done
fi    
