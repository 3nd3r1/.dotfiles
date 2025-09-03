{ lib, config, settings, pkgs, ... }:
let details = settings.themeDetails;
in {

  imports = [
    ../../user/apps/ssh.nix
    ../../user/apps/git.nix
    ../../user/apps/kitty.nix
    ../../user/shells/${settings.shell}.nix
  ] ++ (map (wm: ../../user/wm/${wm}.nix) settings.wms)
    ++ (map (editor: ../../user/editors/${editor}) settings.editors)
    ++ (map (browser: ../../user/browsers/${browser}.nix) settings.browsers);

  home = {
    username = settings.username;
    homeDirectory = "/home/${settings.username}";
  };

  home.packages = with pkgs; [ neofetch docker ];

  home.sessionVariables = {
    EDITOR = settings.preferredEditor;
    BROWSER = settings.preferredBrowser;
  };

  stylix = {
    enable = true;
    polarity = "dark";
    image = details.wallpaper;
    override = lib.mkIf (details.override != null) details.override;
    opacity = {
      terminal = details.opacity;
      applications = details.opacity;
      desktop = details.opacity;
      popups = details.opacity;
    };

    fonts = {
      sansSerif = {
        package = details.fontPkg;
        name = details.font;
      };
      serif = config.stylix.fonts.sansSerif;
      monospace = config.stylix.fonts.sansSerif;
      emoji = config.stylix.fonts.sansSerif;
    };
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.stateVersion = "25.05"; # Please read the comment before changing.
}
