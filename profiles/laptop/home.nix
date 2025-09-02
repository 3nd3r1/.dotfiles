{ config, settings, pkgs, ... }:

{

  imports = [
    ../../user/apps/ssh.nix
    ../../user/apps/git.nix
    ../../user/shells/${settings.shell}.nix
  ] ++ (map (wm: ../../user/wm/${wm}.nix) settings.wms)
    ++ (map (editor: ../../user/editors/${editor}) settings.editors)
    ++ (map (browser: ../../user/browsers/${browser}.nix) settings.browsers);

  home = {
    username = settings.username;
    homeDirectory = "/home/${settings.username}";
  };

  home.packages = with pkgs; [ ];

  home.sessionVariables = {
    EDITOR = settings.preferredEditor;
    BROWSER = settings.preferredBrowser;
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.stateVersion = "25.05"; # Please read the comment before changing.
}
