#!/bin/bash

# resolves wallpaper paths when user chooses from dmenu (no initial arguments)
# if user bails from dmenu, wallpaper home is not prepended
wallpaper-path-helper() {
  if [ $# -eq 0 ]
    then
      local selection=`ls $WALLPAPER_HOME| dmenu`
      if [ -z $selection ]
        then echo $selection
        else echo $WALLPAPER_HOME/$selection
      fi
    else
      echo $@
  fi
}  

# use input image to set colorscheme
set-colorscheme() {
  local IMG=`wallpaper-path-helper $@`
  if [ ! -z $IMG ]
    then wal -n -i $IMG 
  fi
}

# use input image to set colorscheme
set-wallpaper() {
  local IMG=`wallpaper-path-helper $@`
  if [ ! -z $IMG ]
    then feh --bg-fill --no-xinerama $IMG
  fi
}

# set wallpaper and colorscheme at once
set-theme() {
  local IMG=`wallpaper-path-helper $@`
  if [ ! -z $IMG ]
    then wal -n -i $IMG
         set-wallpaper "$(< "${HOME}"/.cache/wal/wal)"
  fi
}

waltest() {
  wal -i "$(< "${HOME}/.cache/wal/wal")" -n
}
