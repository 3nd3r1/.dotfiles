{ pkgs, settings, mkBrewBin, ... }:

{
  programs.yazi = {
    enable = true;
    package = if settings.profile == "work" then mkBrewBin "yazi" else pkgs.yazi;
    enableZshIntegration = true;
    shellWrapperName = "y";
    settings = {
      mgr = {
        show_hidden = true;
      };
    };
  };
}
