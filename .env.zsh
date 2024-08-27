export EDITOR="nvim"

alias vi="nvim"
alias vim="nvim"
alias oldvim="\vim"
alias myscrot='scrot ~/Pictures/Screenshots/%b%d::%H%M%S.png'

export PATH="$PATH:/opt/nvim-linux64/bin"

[ -s "$HOME/.fzf.zsh" ] && source "$HOME/.fzf.zsh"
[ -s "/home/linuxbrew/.linuxbrew/bin/brew" ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
