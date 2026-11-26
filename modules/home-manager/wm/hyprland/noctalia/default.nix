{
  settings,
  themeDetails,
  ...
}:
{
  programs.noctalia = {
    enable = true;
    systemd.enable = true;

    customPalettes.${settings.theme} = import (./palettes + "/${settings.theme}.nix");

    settings = {
      theme = {
        mode = "dark";
        source = "custom";
        custom_palette = settings.theme;
        pure_black_dark = true;
        sync_color_scheme = false;
        templates = {
          enable_builtin_templates = false;
          enable_community_templates = false;
        };
      };

      shell = {
        corner_radius_scale = if themeDetails.rounding == 0 then 0.0 else 1.0;
        circular_avatar = false;
        polkit_agent = true;
        popup_shadows = themeDetails.shadow;
        setup_wizard_enabled = false;
        panel = {
          inherit (themeDetails) shadow;
        };
        greeter_sync = {
          auto_sync = true;
        };
        screenshot = {
          directory = "/home/${settings.username}/Pictures/Screenshots";
          copy_to_clipboard = true;
          save_to_file = true;
          freeze_screen = true;
        };
      };

      bar = {
        order = [ "default" ];
        default = {
          enabled = true;
          position = "top";
          thickness = 34;
          margin_edge = 0;
          margin_ends = 0;
          radius = themeDetails.rounding;
          radius_top_left = themeDetails.rounding;
          radius_top_right = themeDetails.rounding;
          radius_bottom_left = themeDetails.rounding;
          radius_bottom_right = themeDetails.rounding;
          concave_edge_corners = false;
          inherit (themeDetails) shadow;
          background_opacity = themeDetails.opacity;
          compositor_blur = true;
          border = "outline_variant";
          border_width = 1.0;
          capsule = true;
          start = [ "workspaces" ];
          center = [ ];
          end = [
            "cpu"
            "network"
            "bluetooth"
            "volume"
            "battery"
            "clock"
            "tray"
            "notifications"
            "control-center"
          ];
        };
      };

      dock.enabled = false;
      wallpaper = {
        enabled = true;
        directory = "${settings.dotfilesDir}/assets/wallpapers";
        default.path = settings.wallpaper;
      };
      location = {
        address = "Finnoo, Espoo";
        custom_schedule = true;
        sunrise = "07:30";
        sunset = "21:00";
      };
      weather = {
        enabled = true;
        unit = "metric";
      };
      calendar.enabled = true;
      nightlight = {
        enabled = true;
        temperature_day = 6500;
        temperature_night = 4500;
      };
      notification.enable_daemon = true;
      osd.enabled = true;

      lockscreen = {
        enabled = true;
        lock_before_suspend = true;
        inherit (settings) wallpaper;
      };

      idle = {
        behavior_order = [
          "lock"
          "screen-off"
          "lock-and-suspend"
        ];
        behavior = {
          lock = {
            action = "lock";
            enabled = true;
            timeout = 300.0;
          };
          screen-off = {
            action = "screen_off";
            enabled = true;
            timeout = 330.0;
          };
          lock-and-suspend = {
            action = "lock_and_suspend";
            enabled = false;
            timeout = 900.0;
          };
        };
      };
    };
  };
}
