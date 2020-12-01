# set wallpaper directory
export WALLPAPER_HOME=~/images/wallpapers
export HISTSIZE=10000
# allow dotfiles in fzf
export FZF_DEFAULT_COMMAND='rg --files .'

# use wal theme on new terminals
cat ~/.cache/wal/sequences

# source aliases
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# source scripts
if [ -d ~/scripts/bash ]; then
  for f in ~/scripts/bash/*; do source $f; done
fi
