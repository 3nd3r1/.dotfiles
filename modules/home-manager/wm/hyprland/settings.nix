{
  config,
  themeDetails,
  ...
}:
let
  bezier = name: p1: p2: {
    _args = [
      name
      {
        type = "bezier";
        points = [
          p1
          p2
        ];
      }
    ];
  };

  animation =
    leaf: speed: curve: style:
    {
      inherit leaf speed;
      enabled = true;
      bezier = curve;
    }
    // (if style == null then { } else { inherit style; });
in
{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      {
        output = "eDP-1";
        mode = "preferred";
        position = "0x0";
        scale = 1;
      }
      {
        output = "DP-1";
        mode = "preferred";
        position = "1920x0";
        scale = 1;
      }
      {
        output = "HDMI-A-1";
        mode = "preferred";
        position = "1920x0";
        scale = 1;
      }
      {
        output = "";
        mode = "preferred";
        position = "auto";
        scale = 1;
      }
    ];

    curve = [
      (bezier "wind" [ 0.05 0.9 ] [ 0.1 1.05 ])
      (bezier "winIn" [ 0.1 1.1 ] [ 0.1 1.1 ])
      (bezier "winOut"
        [
          0.3
          (-0.3)
        ]
        [ 0 1 ]
      )
      (bezier "liner" [ 1 1 ] [ 1 1 ])
      (bezier "workIn"
        [
          0.72
          (-0.07)
        ]
        [ 0.41 0.98 ]
      )
    ];

    animation = [
      (animation "windows" 6 "wind" "slide")
      (animation "windowsIn" 6 "winIn" "slide")
      (animation "windowsOut" 5 "winOut" "slide")
      (animation "windowsMove" 5 "wind" "slide")
      (animation "border" 1 "liner" null)
      (animation "borderangle" 30 "liner" "loop")
      (animation "fade" 10 "default" null)
      (animation "workspaces" 5 "wind" null)
      (animation "specialWorkspace" 5 "workIn" "slidevert")
    ];

    config = {
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
        inherit (themeDetails) rounding;
        shadow = {
          enabled = themeDetails.shadow;
          offset = [
            2
            2
          ];
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
      };

      dwindle = {
        preserve_split = true;
        force_split = 2;
        split_width_multiplier = 1.5;
      };

      misc = {
        force_default_wallpaper = 0;
        disable_hyprland_logo = true;
        exit_window_retains_fullscreen = 1;
      };

      debug = {
        disable_logs = false;
      };

      input = {
        kb_layout = "fi";
        kb_options = "";
        follow_mouse = 1;
        sensitivity = 0;
        touchpad = {
          natural_scroll = true;
        };
      };
    };
  };
}
