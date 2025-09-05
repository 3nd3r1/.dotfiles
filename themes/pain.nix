{ pkgs, ... }: {
  themeName = "pain";
  wallpaper = ../Pictures/Wallpapers/pain.jpg;

  # Stylix palette override.
  override = {
    base00 = "000000"; # Black
    base01 = "1a1a1a"; # Dark gray
    base02 = "2d2d2d"; # Gray
    base03 = "404040"; # Dark light gray
    base04 = "a0a0a0"; # Base16 convention
    base05 = "ffffff"; # Your color 7 (white) - main foreground
    base06 = "e0e0e0"; # Base16 convention
    base07 = "ffffff"; # Your color 15 (gray90 -> white)
    base08 = "800080"; # Your color 1 (purple)
    base09 = "ff8000"; # Your color 4 (orange)
    base0A = "EE82EE"; # Your color 2 (light purple)
    base0B = "800080"; # Your color 3 (purple)
    base0C = "72147E"; # Your color 5 (dark magenta)
    base0D = "FF5200"; # Your color 6 (red-orange)
    base0E = "800080"; # Your color 9 (purple)
    base0F = "EE82EE"; # Your color 10 (light purple)
  };

  # Override stylix theme of btop.
  # btopTheme = "catppuccin";

  # Hyprland and ags.
  opacity = 0.8;
  rounding = 0;
  shadow = false;
  bordersPlusPlus = false;

  # Override default settings in ags.
  shell = "ags";
  ags = {
    theme = {
      palette = { widget = "#25253a"; };
      border = {
        width = 1;
        opacity = 96;
      };
    };
    bar = { curved = true; };
    widget = { opacity = 0; };
  };

  font = "MesloLGLDZNerdFont"; # Selected font
  fontPkg = (pkgs.nerd-fonts.meslo-lg);
  fontSize = 12; # Font size

  icons = "Papirus";
  iconsPkg = pkgs.papirus-icon-theme;
}
