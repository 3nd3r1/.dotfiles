{ pkgs, ... }:
{
  themeName = "pain";

  # Stylix palette override.
  base16Scheme = {
    base00 = "#000000";
    base08 = "#800080";
    base0B = "#EE82EE";
    base0A = "#800080";
    base0D = "#FF8000";
    base0E = "#72147E";
    base0C = "#FF5200";

    base03 = "#404040";
    base05 = "#FFFFFF";
    base07 = "#FFFFFF";

    base01 = "#800080";
    base02 = "#800080";
    base04 = "#800080";
    base06 = "#800080";
    base09 = "#800080";
    base0F = "#800080";
  };

  override = { };

  # Override stylix theme of btop.
  # btopTheme = "catppuccin";

  opacity = 0.8;
  rounding = 0;
  shadow = false;
  bordersPlusPlus = false;

  font = {
    name = "MesloLGLDZNerdFont";
    package = pkgs.nerd-fonts.meslo-lg;
    size = 12;
  };

  icons = {
    name = "Material-Black-Plum-Suru";
    package = pkgs.material-black-plum-suru-icons;
  };

  theme = {
    name = "Material-Black-Plum-BE";
    package = pkgs.material-black-plum-be-colors;
  };

  cursor = {
    name = "phinger-cursors-light";
    package = pkgs.phinger-cursors;
    size = 32;
  };
}
