{
  config,
  pkgs,
  settings,
  themeDetails,
  inputs,
  ...
}:
{
  home.packages = with pkgs; [
    swww
    wayvnc
  ];

  wayland.windowManager.hyprland.settings = {
    monitor = [
      ",preferred,auto,1"
    ];

    exec-once = [
    ];

    general = {
      gaps_in = 5;
      gaps_out = 20;
      border_size = 2;

      allow_tearing = false;

      "col.active_border" = "rgba(${config.lib.stylix.colors.base0D}ff)";
      "col.inactive_border" = "rgba(${config.lib.stylix.colors.base02}ff)";
    };

    cursor = {
      inactive_timeout = 5;
    };

    decoration = {
      dim_special = 0.5;
      rounding = themeDetails.rounding;
      blur = {
        enabled = true;
        special = true;
        brightness = 1.0;
        contrast = 1.0;
        noise = 0.02;
        passes = 3;
        size = 10;
      };

      shadow = {
        enabled = details.shadow;
        ignore_window = false;
        offset = "2 2";
        range = 20;
        color = "rgba(${config.lib.stylix.colors.base00}ff)";
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

    debug = {
      disable_logs = false;
    };

    input = {
      kb_layout = "us,ru";
      kb_options = "grp:alt_shift_toggle";
      follow_mouse = true;
      touchpad = {
        natural_scroll = true;
      };
    };

    device = {
      name = "logitech-usb-receiver-mouse";
      sensitivity = -1.0;
    };

    gestures = {
      workspace_swipe_forever = true;
      workspace_swipe_distance = 200;
    };

    dwindle = {
      # keep floating dimentions while tiling
      pseudotile = true;
      preserve_split = true;
      force_split = 2;
      split_width_multiplier = 1.5;
    };

    misc = {
      force_default_wallpaper = -1;
      exit_window_retains_fullscreen = true;
    };
  };
}
