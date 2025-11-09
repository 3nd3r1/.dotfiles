{
  config,
  themeDetails,
  ...
}:
{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      "eDP-1,preferred,0x0,1"
      "DP-1,preferred,1920x0,1"
      "HDMI-A-1,preferred,1920x0,1"
      ",preferred,auto,1"
    ];

    general = {
      gaps_in = 5;
      gaps_out = 10;
      border_size = 2;

      allow_tearing = false;

      "col.active_border" = "rgba(${config.lib.stylix.colors.base0D}ff)";
      "col.inactive_border" = "rgba(${config.lib.stylix.colors.base02}ff)";
    };

    cursor = {
      inactive_timeout = 5;
    };

    decoration = {
      rounding = themeDetails.rounding;
      shadow = {
        enabled = themeDetails.shadow;
        ignore_window = false;
        offset = "2 2";
        range = 20;
        color = "rgba(${config.lib.stylix.colors.base00}ff)";
      };
      blur = {
        enabled = true;
        special = true;
        brightness = 1.0;
        contrast = 1.0;
        noise = 0.02;
        passes = 3;
        size = 10;
      };
    };

    animations = {
      enabled = true;
      bezier = [
        "wind, 0.05, 0.9, 0.1, 1.05"
        "winIn, 0.1, 1.1, 0.1, 1.1"
        "winOut, 0.3, -0.3, 0, 1"
        "liner, 1, 1, 1, 1"
        "workIn, 0.72, -0.07, 0.41, 0.98"
      ];
      animation = [
        "windows, 1, 6, wind, slide"
        "windowsIn, 1, 6, winIn, slide"
        "windowsOut, 1, 5, winOut, slide"
        "windowsMove, 1, 5, wind, slide"
        "border, 1, 1, liner"
        "borderangle, 1, 30, liner, loop"
        "fade, 1, 10, default"
        "workspaces, 1, 5, wind"
        "specialWorkspace, 1, 5, workIn, slidevert"
      ];
    };

    dwindle = {
      pseudotile = true;
      preserve_split = true;
      force_split = 2;
      split_width_multiplier = 1.5;
    };

    misc = {
      force_default_wallpaper = 0;
      disable_hyprland_logo = true;
      exit_window_retains_fullscreen = true;
    };

    debug = {
      disable_logs = false;
    };

    input = {
      kb_layout = "fi";
      kb_options = "";
      follow_mouse = true;
      sensitivity = 0;
      touchpad = {
        natural_scroll = true;
      };
    };
  };
}
