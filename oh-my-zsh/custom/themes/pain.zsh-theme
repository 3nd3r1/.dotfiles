PROMPT="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$ "
RPROMPT='$(virtualenv_prompt_info) $(git_prompt_info)'

ZSH_THEME_VIRTUALENV_PREFIX="%F{7} %F{2}venv:%F{4}"
ZSH_THEME_VIRTUALENV_SUFFIX=" %f"

ZSH_THEME_GIT_PROMPT_PREFIX="%F{7} %F{2}git:%F{4}"
ZSH_THEME_GIT_PROMPT_DIRTY=""
ZSH_THEME_GIT_PROMPT_CLEAN=""
ZSH_THEME_GIT_PROMPT_SUFFIX=" %f"
