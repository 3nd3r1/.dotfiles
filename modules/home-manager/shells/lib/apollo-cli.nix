{ config, ... }:

{
  programs.zsh.initContent = ''
    apollo_completion="${config.xdg.configHome}/zsh/completions/_apollo-cli"
    if [ ! -f "$apollo_completion" ] && command -v apollo-cli >/dev/null 2>&1; then
      mkdir -p "$(dirname "$apollo_completion")"
      apollo-cli completion zsh > "$apollo_completion"
    fi
  '';
}
