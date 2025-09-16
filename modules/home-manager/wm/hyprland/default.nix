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
    ./shells/ags
    "${homeManagerModulesPath}/apps/rofi"
  ];

  home.packages = with pkgs; [
    hyprcursor
    rose-pine-hyprcursor
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
    extraConfig = (builtins.readFile ./hyprland.conf);
  };
}
