{
  inputs,
  config,
  lib,
  settings,
  pkgs,
  nixGL,
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

  nixGL = {
    packages = nixGL.packages;
    defaultWrapper = "mesa";
  };

  wayland.windowManager.hyprland = {
    enable = true;
    package = config.lib.nixGL.wrap inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };
}
