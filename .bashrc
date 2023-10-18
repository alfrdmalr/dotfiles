
# use wal theme on new terminals
cat ~/.cache/wal/sequences

# source aliases
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

# source local (secret) aliases
if [ -f ~/.bash_local_aliases ]; then
  source ~/.bash_local_aliases
fi

# source scripts
if [ -d ~/scripts/bash ]; then
  for f in ~/scripts/bash/*; do source $f; done
fi

# source node version manager
source /usr/share/nvm/init-nvm.sh
