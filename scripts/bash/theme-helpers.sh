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

# takes two arguments: a theming-related command, and an image path to handle and pass in 
theme-wrapper() {
  local IMG=`wallpaper-path-helper ${2}`
  if [ ! -z $IMG ]
    then eval ${1} $IMG
  fi
}

# use input image to set colorscheme
set-colorscheme() {
  theme-wrapper 'wal -n -i' $@ 
}

# use input image to set colorscheme
set-wallpaper() {
  theme-wrapper 'feh --bg-fill --no-xinerama' $@
}

# set wallpaper and colorscheme at once
set-theme() {
  set-both() {
    wal -n -i ${1}
    set-wallpaper ${1}
  }
  theme-wrapper 'set-both' $@
}
