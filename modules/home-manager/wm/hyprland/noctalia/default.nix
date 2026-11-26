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
        polkit_agent = false;
        popup_shadows = themeDetails.shadow;
        setup_wizard_enabled = false;
        panel = {
          inherit (themeDetails) shadow;
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
          border_width = 1.0;
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
      wallpaper.enabled = false;
      notification.enable_daemon = true;
      osd.enabled = true;
    };
  };
}
