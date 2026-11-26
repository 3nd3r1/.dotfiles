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
      format = "[\\[](bold red)$username[@](bold green)$hostname $directory[\\]](bold red)$character";
      right_format = "$nix_shell$python$git_branch$git_status$cmd_duration";

      username = {
        show_always = true;
        style_user = "bold yellow";
        style_root = "bold red";
        format = "[$user]($style)";
      };

      hostname = {
        ssh_only = false;
        style = "bold blue";
        format = "[$hostname]($style)";
      };

      directory = {
        style = "bold purple";
        truncation_length = 3;
        truncate_to_repo = false;
        format = "[$path]($style)";
      };

      character = {
        success_symbol = "\\$ ";
        error_symbol = "[\\$](bold red) ";
        vimcmd_symbol = "[V](bold blue) ";
      };

      git_branch = {
        symbol = " ";
        style = "blue";
        format = "[$symbol](white)[git:](green)[$branch]($style) ";
      };

      git_status = {
        style = "red";
        format = "([$all_status$ahead_behind]($style) )";
      };

      python = {
        symbol = " ";
        style = "blue";
        format = "[$symbol](white)[venv:](green)[($virtualenv)]($style) ";
        detect_files = [ ];
        detect_extensions = [ ];
      };

      nix_shell = {
        symbol = " ";
        style = "purple";
        format = "[$symbol](white)[$state]($style) ";
      };

      cmd_duration = {
        min_time = 2000;
        style = "yellow";
        format = "[$duration]($style)";
      };
    };
  };
}
