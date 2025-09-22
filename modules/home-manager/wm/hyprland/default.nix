{
  inputs,
  config,
  settings,
  pkgs,
  ...
}:
let
  homeManagerModulesPath = "${inputs.self}/modules/home-manager";
  hyprlandPkg =
    if settings.nixgl then
      config.lib.nixGL.wrap inputs.hyprland.packages.${pkgs.system}.hyprland
    else
      inputs.hyprland.packages.${pkgs.system}.hyprland;
in
{
  imports = [
    ./settings.nix
    ./keybinds.nix
    ./rules.nix

    ./waybar
    ./hyprpaper
    ./hyprlock

    "${homeManagerModulesPath}/apps/rofi"
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = if settings.profile == "work" then false else true;
    package = hyprlandPkg;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };
}
