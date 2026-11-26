{
  settings,
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    sf-pro-display-font
    steelfish-outline-regular-font
  ];

  programs.hyprlock = {
    enable = true;
    settings = {
      background = [
        {
          path = settings.wallpaper;
          blur_passes = 1;
          contrast = 0.8916;
          brightness = 0.8172;
          vibrancy = 0.1696;
          vibrancy_darkness = 0.0;
        }
      ];
      general = {
        no_fade_in = false;
        grace = 0;
        disable_loading_bar = false;
      };
      auth = {
        "pam:enabled" = true;
        "pam:module" = "hyprlock";
      };

      # Time
      label = [
        # Day-Month-Date
        {
          text = ''cmd[update:1000] echo "$(date +'%A, %B %d')"'';
          color = "rgba(216, 222, 233, .7)";
          font_size = 28;
          font_family = "SF Pro Display Bold";
          position = "0, 490";
          halign = "center";
          valign = "center";
        }
        # Clock
        {
          text = "$TIME";
          color = "rgba(216, 222, 233, .7)";
          font_size = 240;
          font_family = "steelfish outline regular";
          position = "0, 300";
          halign = "center";
          valign = "center";
        }
        # USER
        {
          text = "   $USER";
          color = "rgba(216, 222, 233, 0.80)";
          outline_thickness = 2;
          dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.2; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true;
          font_size = 24;
          font_family = "SF Pro Display Bold";
          position = "0, -180";
          halign = "center";
          valign = "center";
        }
        # Keyboard Layout
        {
          text = "⌨ $LAYOUT";
          color = "rgba(216, 222, 233, .7)"; # Purple from pain theme
          font_size = 12;
          font_family = "SF Pro Display Bold";
          position = "0, -500";
          halign = "center";
          valign = "center";
        }
      ];

      # INPUT FIELD
      input-field = [
        {
          size = "300, 60";
          outline_thickness = 2;
          dots_size = 0.2; # Scale of input-field height, 0.2 - 0.8
          dots_spacing = 0.2; # Scale of dots' absolute size, 0.0 - 1.0
          dots_center = true;
          outer_color = "rgba(255, 255, 255, 0)";
          inner_color = "rgba(255, 255, 255, 0.1)";
          font_color = "rgb(200, 200, 200)";
          fade_on_empty = false;
          font_family = "SF Pro Display Bold";
          placeholder_text = "<i><span foreground='##ffffff99'>🔒 Enter Pass</span></i>";
          hide_input = false;
          position = "0, -250";
          halign = "center";
          valign = "center";
        }
      ];
    };
  };
}
