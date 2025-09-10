{ lib, config, settings, pkgs, inputs, ... }:
let
  themeDetails = import ("${inputs.self}/themes/${settings.theme}.nix") { inherit pkgs; };
  homeManagerModulesPath = "${inputs.self}/modules/home-manager";
in {
  imports = [
    "${homeManagerModulesPath}/apps/ssh.nix"
    "${homeManagerModulesPath}/apps/git.nix"
    "${homeManagerModulesPath}/shells/${settings.shell}"
  ] ++ (map (terminal: "${homeManagerModulesPath}/terminals/${terminal}.nix") settings.terminals)
    ++ (map (editor: "${homeManagerModulesPath}/editors/${editor}") settings.editors)
    ++ (map (wm: "${homeManagerModulesPath}/wm/${wm}") settings.wms);

  home = {
    username = settings.username;
    homeDirectory = "/home/${settings.username}";
    shell = { enableZshIntegration = true; };
    sessionVariables = {
    EDITOR = settings.preferredEditor;
    BROWSER = settings.preferredBrowser;
    USERNAME = settings.username;
    };
  };
  home.packages = with pkgs; [ neofetch docker ];

  nixpkgs.config.allowUnfree = true;

  stylix = {
    enable = true;
    polarity = "dark";
    image = themeDetails.wallpaper;
    override = lib.mkIf (themeDetails.override != null) themeDetails.override;
    opacity = {
      terminal = themeDetails.opacity;
      applications = themeDetails.opacity;
      desktop = themeDetails.opacity;
      popups = themeDetails.opacity;
    };

    fonts = {
      sansSerif = {
        package = themeDetails.fontPkg;
        name = themeDetails.font;
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
