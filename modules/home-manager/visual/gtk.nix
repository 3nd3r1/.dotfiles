{
  themeDetails,
  pkgs,
  lib,
  ...
}:
lib.mkIf pkgs.stdenv.hostPlatform.isLinux {
  gtk = {
    enable = true;
    iconTheme = lib.mkForce themeDetails.icons;
    theme = lib.mkForce themeDetails.theme;
    # Do NOT import the GTK3 theme's CSS into GTK4: Material-Black-Plum has no
    # libadwaita support and wrecks GNOME 50 apps (nautilus, papers, ...).
    # GTK3 apps (thunar) stay themed; libadwaita apps use Adwaita, forced dark.
    gtk4.theme = lib.mkForce null;
  };

  dconf.settings."org/gnome/desktop/interface".color-scheme = "prefer-dark";
}
