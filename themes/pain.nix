{ pkgs, ... }: {
  themeName = "pain";
  wallpaper = ../Pictures/Wallpapers/pain.jpg;

  # Stylix palette override.
  override = {
    base00 = "000000"; # background (black)
    base01 = "800080"; # lighter background
    base02 = "EE82EE"; # selection background
    base03 = "800080"; # comments
    base04 = "ff8000"; # dark foreground
    base05 = "72147E"; # default foreground
    base06 = "FF5200"; # light foreground
    base07 = "ffffff"; # lightest foreground (white)
    base08 = "808080"; # variables (gray50)
    base09 = "800080"; # integers
    base0A = "EE82EE"; # classes
    base0B = "800080"; # strings
    base0C = "ff8000"; # support
    base0D = "72147E"; # functions
    base0E = "FF5200"; # keywords
    base0F = "e5e5e5"; # deprecated (gray90)
  };

  # Override stylix theme of btop.
  # btopTheme = "catppuccin";

  # Hyprland and ags.
  opacity = 0.8;
  rounding = 25;
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
