{
  inputs,
  pkgs,
  settings,
  lib,
  ...
}:
let
  hyprlandPkg = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
  greeterConfig = pkgs.writeText "hyprland-greeter.conf" ''
    monitor=eDP-1,preferred,0x0,1
    monitor=DP-1,preferred,0x0,1,mirror,eDP-1
    monitor=HDMI-A-1,preferred,0x0,1,mirror,eDP-1

    env = XCURSOR_THEME,phinger-cursors-light
    env = XCURSOR_SIZE,32

    exec-once = ${pkgs.regreet}/bin/regreet; ${hyprlandPkg}/bin/hyprctl dispatch exit

    cursor {
      no_hardware_cursors = true
    }

    misc {
      disable_hyprland_logo = true
      disable_splash_rendering = true
    }
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
      background = {
        path = settings.wallpaper;
        fit = "Cover";
      };
      GTK = {
        application_prefer_dark_theme = true;
        cursor_theme_name = lib.mkForce "phinger-cursors-light";
      };
    };
  };

  services.greetd.settings.default_session.command =
    lib.mkForce "${hyprlandPkg}/bin/start-hyprland -- --config ${greeterConfig}";
}
