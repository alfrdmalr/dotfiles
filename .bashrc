# .bashrc
# sourced in every shell

#eval "$(ssh-agent)"

# for ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# set wallpaper directory
export WALLPAPER_HOME=~/images/wallpapers
export HISTSIZE=10000
# allow dotfiles in fzf
export FZF_DEFAULT_COMMAND='rg --files .'

# source aliases
if [ -f ~/.bash_aliases ]; then
  source ~/.bash_aliases
fi

if [ -f ~/.profile ]; then
  source ~/.profile
fi

# source local (secret) aliases
if [ -f ~/.bash_local_aliases ]; then
  source ~/.bash_local_aliases
fi

# source scripts
if [ -d ~/scripts/bash ]; then
  for f in ~/scripts/bash/*; do source $f; done
fi

#
## development  
#

# source node version manager
source /usr/share/nvm/init-nvm.sh

# nvm alias default <version> to set this default
# running on every shell so I don't have to run `nvm use <version>` constantly
nvm use default > /dev/null
