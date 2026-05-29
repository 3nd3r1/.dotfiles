{ pkgs, settings, ... }:

{
  programs.direnv = {
    enable = true;
    package = if settings.profile == "work" then pkgs.emptyDirectory else pkgs.direnv;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
