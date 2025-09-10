{ lib, config, settings, pkgs, inputs, ... }:
let
details = settings.themeDetails;
homeManagerModulesPath = "${inputs.self}/modules/home-manager";
in {
  imports = [
    "${homeManagerModulesPath}/apps/ssh.nix"
    "${homeManagerModulesPath}/apps/git.nix"
    "${homeManagerModulesPath}/shells/${settings.shell}"
  ] ++ (map (editor: "${homeManagerModulesPath}/editors/${editor}") settings.editors)
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

  # stylix = {
  #   enable = true;
  #   polarity = "dark";
  #   image = details.wallpaper;
  #   override = lib.mkIf (details.override != null) details.override;
  #   opacity = {
  #     terminal = details.opacity;
  #     applications = details.opacity;
  #     desktop = details.opacity;
  #     popups = details.opacity;
  #   };
  #
  #   fonts = {
  #     sansSerif = {
  #       package = details.fontPkg;
  #       name = details.font;
  #     };
  #     serif = config.stylix.fonts.sansSerif;
  #     monospace = config.stylix.fonts.sansSerif;
  #     emoji = config.stylix.fonts.sansSerif;
  #   };
  # };
  #
  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
  home.stateVersion = "25.05"; # Please read the comment before changing.
}
