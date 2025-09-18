{
  inputs,
  settings,
  themeDetails,
  pkgs,
  lib,
  config,
  ...
}:
{

  # This will ensure the font is loaded
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    themeDetails.font.package
  ];

  stylix = {
    enable = true;
    polarity = "dark"; # I WILL NOT ALLOW CHANGING THIS
    image = settings.wallpaper;
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

    autoEnable = false;
    targets = {
      lazygit.enable = false;
      kitty.enable = false;
      nixvim.enable = false;
      tmux.enable = false;
      hyprlock.enable = false;
      hyprland.enable = false;
      btop.enable = false;
      gnome.enable = false;
      gtk.enable = false;
      rofi.enable = false;
    };
  };
}
