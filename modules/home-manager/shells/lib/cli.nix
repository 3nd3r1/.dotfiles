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
  home.packages = lib.optionals (!isWork) (with pkgs; [ dust ]);

  programs = {
    btop = {
      enable = true;
      package = if isWork then mkBrewBin "btop" else pkgs.btop;
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
