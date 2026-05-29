{ pkgs, settings, mkBrewBin, ... }:

{
  programs.direnv = {
    enable = true;
    package = if settings.profile == "work" then mkBrewBin "direnv" else pkgs.direnv;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
