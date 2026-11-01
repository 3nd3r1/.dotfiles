{
  pkgs,
  lib,
  ...
}:
let
  hyprlandPkg = pkgs.hyprland;
  # Hyprland picks the Lua config provider from the .lua extension.
  greeterConfig = pkgs.writeText "hyprland-greeter.lua" ''
    hl.monitor({ output = "eDP-1", mode = "preferred", position = "0x0", scale = 1 })
    hl.monitor({ output = "DP-1", mode = "preferred", position = "0x0", scale = 1, mirror = "eDP-1" })
    hl.monitor({ output = "HDMI-A-1", mode = "preferred", position = "0x0", scale = 1, mirror = "eDP-1" })

    hl.env("XCURSOR_THEME", "phinger-cursors-light")
    hl.env("XCURSOR_SIZE", "32")

    hl.on("hyprland.start", function()
      hl.exec_cmd("${pkgs.regreet}/bin/regreet; ${hyprlandPkg}/bin/hyprctl dispatch 'hl.dsp.exit()'")
    end)

    hl.config({
      cursor = {
        no_hardware_cursors = 1,
      },
      misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
      },
    })
  '';
in
{
  environment.systemPackages = [ pkgs.phinger-cursors ];

  programs.regreet = {
    enable = true;
    settings = {
      default_session = {
        command = "Hyprland";
      };
      # No background: regreet 0.5.0 loads it via glycin (sandboxed loaders +
      # bwrap), which the greeter session lacks, so it hangs on a broken image.
      GTK = {
        application_prefer_dark_theme = true;
        cursor_theme_name = lib.mkForce "phinger-cursors-light";
      };
    };
  };

  services.greetd.settings.default_session.command =
    lib.mkForce "${hyprlandPkg}/bin/start-hyprland -- --config ${greeterConfig}";
}
