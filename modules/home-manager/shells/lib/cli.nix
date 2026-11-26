{
  pkgs,
  lib,
  settings,
  mkBrewBin,
  ...
}:
let
  isWork = settings.profile == "graff";
in
{
  home = {
    packages = lib.optionals (!isWork) (with pkgs; [ dust ]);
    sessionVariables = {
      MANPAGER = "sh -c 'col -bx | bat -l man -p'";
    };
  };

  programs = {
    btop = {
      enable = true;
      package = if isWork then mkBrewBin "btop" else pkgs.btop;
    };

    bat = {
      enable = true;
      package = if isWork then mkBrewBin "bat" else pkgs.bat;
      config = {
        theme = "ansi";
      };
    };

    eza = {
      enable = true;
      package = if isWork then mkBrewBin "eza" else pkgs.eza;
      enableZshIntegration = true;
      icons = "auto";
      git = true;
    };
  };
}
