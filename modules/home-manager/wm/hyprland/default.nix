{
  inputs,
  config,
  lib,
  settings,
  pkgs,
  ...
}:
let
  homeManagerModulesPath = "${inputs.self}/modules/home-manager";
in
{
  imports = [
    ./settings.nix
    ./keybinds.nix
    ./rules.nix

    ./waybar
    ./hyprpaper

    "${homeManagerModulesPath}/apps/rofi"
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };
}
