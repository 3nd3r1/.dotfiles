{ lib, config, settings, pkgs, inputs, ... }:
let 
details = settings.themeDetails;
homeManagerModulesPath = "${inputs.self}/modules/home-manager";
in {
  imports = [
    "${homeManagerModulesPath}/apps/ssh.nix"
    "${homeManagerModulesPath}/apps/git.nix"
    "${homeManagerModulesPath}/apps/kitty.nix"
    "${homeManagerModulesPath}/apps/lanmouse.nix"
    "${homeManagerModulesPath}/shells/${settings.shell}"
  ] ++ (map (wm: "${homeManagerModulesPath}/wm/${wm}") settings.wms)
    ++ (map (editor: "${homeManagerModulesPath}/editors/${editor}") settings.editors)
    ++ (map (browser: "${homeManagerModulesPath}/browsers/${browser}.nix") settings.browsers);

  home = {
    username = settings.username;
    homeDirectory = "/home/${settings.username}";
    sessionVariables = {
      EDITOR = settings.preferredEditor;
      BROWSER = settings.preferredBrowser;
    };
  };

  home.packages = with pkgs; [ neofetch docker ];

  nixpkgs.config.allowUnfree = true;

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
