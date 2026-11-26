let
  dark = {
    primary = "#FF8000";
    on_primary = "#000000";
    secondary = "#800080";
    on_secondary = "#FFFFFF";
    tertiary = "#FF5200";
    on_tertiary = "#000000";
    error = "#FF5200";
    on_error = "#000000";
    surface = "#000000";
    on_surface = "#FFFFFF";
    surface_container = "#1a0822";
    on_surface_container = "#FFFFFF";
    surface_variant = "#2e0d3d";
    on_surface_variant = "#EE82EE";
    outline = "#800080";
    outline_variant = "#800080";
    hover = "#6a046e";
    on_hover = "#FFFFFF";
    shadow = "#000000";
    terminal = {
      black = "#000000";
      red = "#800080";
      green = "#EE82EE";
      yellow = "#800080";
      blue = "#FF8000";
      magenta = "#72147E";
      cyan = "#FF5200";
      white = "#FFFFFF";
      bright_black = "#404040";
      bright_red = "#800080";
      bright_green = "#EE82EE";
      bright_yellow = "#800080";
      bright_blue = "#FF8000";
      bright_magenta = "#72147E";
      bright_cyan = "#FF5200";
      bright_white = "#FFFFFF";
      foreground = "#FFFFFF";
      background = "#000000";
      selection_fg = "#000000";
      selection_bg = "#FF8000";
      cursor_text = "#000000";
      cursor = "#FFFFFF";
    };
  };
in
{
  version = 2;
  inherit dark;
  light = dark;
}
