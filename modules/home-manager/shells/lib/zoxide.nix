{
  pkgs,
  settings,
  mkBrewBin,
  ...
}:

{
  programs.zoxide = {
    enable = true;
    package = if settings.profile == "graff" then mkBrewBin "zoxide" else pkgs.zoxide;
    enableZshIntegration = true;
  };
}
