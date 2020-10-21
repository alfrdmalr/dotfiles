alias reload='source ~/.bashrc'
alias ll='ls -l'
alias la='ls -la'
alias suspend='systemctl suspend'
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias restart-picom='pkill picom; picom -b --experimental-backends'
alias goodnight='poweroff'
alias checkout='git checkout $(git branch | fzf)'
alias activate='source venv/bin/activate'
alias uncommit='git reset --soft HEAD^'
alias refresh-wal='wal -nf ~/.cache/wal/colors.json'
