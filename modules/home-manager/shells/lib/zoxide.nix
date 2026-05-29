{ pkgs, settings, mkBrewBin, ... }:

{
  programs.zoxide = {
    enable = true;
    package = if settings.profile == "work" then mkBrewBin "zoxide" else pkgs.zoxide;
    enableZshIntegration = true;
  };
}
