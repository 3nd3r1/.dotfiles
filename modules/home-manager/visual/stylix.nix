{
  inputs,
  themeDetails,
  pkgs,
  lib,
  config,
  ...
}:
{
  stylix = {
    enable = true;
    polarity = "dark"; # I WILL NOT ALLOW CHANGING THIS
    image = themeDetails.wallpaper;
    base16Scheme = themeDetails.base16Scheme;
    override = lib.mkIf (themeDetails.override != null) themeDetails.override;
    opacity = {
      terminal = themeDetails.opacity;
      applications = themeDetails.opacity;
      desktop = themeDetails.opacity;
      popups = themeDetails.opacity;
    };

    cursor = themeDetails.cursor;

    fonts = {
      sansSerif = {
        name = themeDetails.font.name;
        package = themeDetails.font.package;
      };
      serif = config.stylix.fonts.sansSerif;
      monospace = config.stylix.fonts.sansSerif;
      emoji = config.stylix.fonts.sansSerif;
    };

    targets = {
      lazygit.enable = true;
      kitty.enable = true;
      nixvim.enable = false;
      tmux.enable = false;
      hyprlock.enable = false;
      hyprland.enable = false;
      btop.enable = false;
      gnome.enable = false;
      rofi.enable = false;
    };
  };
}
