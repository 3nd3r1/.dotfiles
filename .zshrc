export XDG_CONFIG_HOME="$HOME/.config"
export ZSH="$XDG_CONFIG_HOME/oh-my-zsh"

ZSH_THEME="pain"

# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time
# zstyle ':omz:update' frequency 13

# DISABLE_MAGIC_FUNCTIONS="true"
# DISABLE_LS_COLORS="true"
# DISABLE_AUTO_TITLE="true"
# ENABLE_CORRECTION="true"
# COMPLETION_WAITING_DOTS="true"
# DISABLE_UNTRACKED_FILES_DIRTY="true"
# HIST_STAMPS="mm/dd/yyyy"
ZSH_CUSTOM="$XDG_CONFIG_HOME/oh-my-zsh/custom"

# Completions
zstyle ':completion:*' menu select
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

# Tmux settings
ZSH_TMUX_AUTOSTART=true
ZSH_TMUX_AUTOSTART_ONCE=false
ZSH_TMUX_AUTOQUIT=true
ZSH_TMUX_CONFIG="$XDG_CONFIG_HOME/tmux/tmux.conf"
ZSH_TMUX_DEFAULT_SESSION_NAME="terminal"

# Fzf settings
DISABLE_FZF_AUTO_COMPLETION="true"
DISABLE_FZF_KEY_BINDINGS="false"

# Custom completions
fpath=($ZSH_CUSTOM/completions $fpath)

# Load aliases and vars
[ -f ~/.env.zsh ] && source ~/.env.zsh

# Load private aliases and vars
[ -f ~/.env.private.zsh ] && source ~/.env.private.zsh

plugins=(git nvm zoxide tmux vi-mode zsh-autosuggestions zsh-syntax-highlighting helm kubectl docker fzf golang)

source $ZSH/oh-my-zsh.sh

# zsh-autosuggestions settings
bindkey '^ ' autosuggest-accept
