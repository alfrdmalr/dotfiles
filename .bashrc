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
if [ -d ~/.bash_scripts ]; then
  for f in ~/.bash_scripts/*; do source $f; done
fi    
