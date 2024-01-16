# Setup fzf
# ---------
if [[ ! "$PATH" == */home/viljami/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/viljami/.fzf/bin"
fi

# Auto-completion
# ---------------
source "/home/viljami/.fzf/shell/completion.zsh"

# Key bindings
# ------------
source "/home/viljami/.fzf/shell/key-bindings.zsh"
