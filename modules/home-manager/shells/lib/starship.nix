{
  pkgs,
  settings,
  mkBrewBin,
  ...
}:
let
  isWork = settings.profile == "graff";
in
{
  programs.starship = {
    enable = true;
    package = if isWork then mkBrewBin "starship" else pkgs.starship;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      format = "[\\[](bold #800080)$username[@](bold #ee82ee)$hostname $directory[\\]](bold #800080)$character";
      right_format = "$nix_shell$python$git_branch$git_status$cmd_duration";

      username = {
        show_always = true;
        style_user = "bold #ff8000";
        style_root = "bold #ff5200";
        format = "[$user]($style)";
      };

      hostname = {
        ssh_only = false;
        style = "bold #ff8000";
        format = "[$hostname]($style)";
      };

      directory = {
        style = "bold #ee82ee";
        truncation_length = 3;
        truncate_to_repo = false;
        format = "[$path]($style)";
      };

      character = {
        success_symbol = "[\\$](bold white) ";
        error_symbol = "[\\$](bold #ff5200) ";
        vimcmd_symbol = "[V](bold #ff8000) ";
      };

      git_branch = {
        symbol = " ";
        style = "bold #ff8000";
        format = "[$symbol$branch]($style) ";
      };

      git_status = {
        style = "bold #ff5200";
        format = "([$all_status$ahead_behind]($style) )";
      };

      python = {
        symbol = " ";
        style = "bold #ee82ee";
        format = "[$symbol($virtualenv)]($style) ";
        detect_files = [ ];
        detect_extensions = [ ];
      };

      nix_shell = {
        symbol = " ";
        style = "bold #800080";
        format = "[$symbol$state]($style) ";
      };

      cmd_duration = {
        min_time = 2000;
        style = "bold #ff5200";
        format = "[$duration]($style)";
      };
    };
  };
}
