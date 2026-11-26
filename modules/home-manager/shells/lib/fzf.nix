{
  pkgs,
  lib,
  settings,
  ...
}:
let
  isWork = settings.profile == "graff";
  fdCmd = "fd --hidden --follow --exclude .git";
in
{
  programs = {
    fzf = lib.mkIf (!isWork) {
      enable = true;
      package = pkgs.fzf;
      enableZshIntegration = true;
      defaultCommand = "${fdCmd} --type f";
      fileWidget.command = fdCmd;
      changeDirWidget.command = "${fdCmd} --type d";
    };

    zsh.initContent = lib.mkIf isWork ''
      if [[ -o interactive ]] && command -v fzf >/dev/null 2>&1; then
        export FZF_DEFAULT_COMMAND="${fdCmd} --type f"
        export FZF_CTRL_T_COMMAND="${fdCmd}"
        export FZF_ALT_C_COMMAND="${fdCmd} --type d"
        source <(fzf --zsh)
      fi
    '';
  };
}
