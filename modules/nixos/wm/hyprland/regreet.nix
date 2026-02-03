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
    monitor=,preferred,0x0,1

    exec-once = ${pkgs.regreet}/bin/regreet; ${hyprlandPkg}/bin/hyprctl dispatch exit

    misc {
      disable_hyprland_logo = true
      disable_splash_rendering = true
    }
  '';
in
{
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
      };
    };
  };

  services.greetd.settings.default_session.command =
    lib.mkForce "${hyprlandPkg}/bin/Hyprland --config ${greeterConfig}";
}
