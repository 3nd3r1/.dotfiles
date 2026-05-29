{ pkgs, settings, ... }:

{
  programs.yazi = {
    enable = true;
    package = if settings.profile == "work" then pkgs.emptyDirectory else pkgs.yazi;
    enableZshIntegration = true;
    shellWrapperName = "y";
    settings = {
      mgr = {
        show_hidden = true;
      };
    };
  };
}
