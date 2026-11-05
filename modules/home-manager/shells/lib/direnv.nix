{
  pkgs,
  settings,
  mkBrewBin,
  ...
}:

{
  programs.direnv = {
    enable = true;
    package = if settings.profile == "graff" then mkBrewBin "direnv" else pkgs.direnv;
    enableZshIntegration = true;
    nix-direnv.enable = true;
  };
}
