{ pkgs, settings, ... }:

{
  programs.zoxide = {
    enable = true;
    package = if settings.profile == "work" then pkgs.emptyDirectory else pkgs.zoxide;
    enableZshIntegration = true;
  };
}
