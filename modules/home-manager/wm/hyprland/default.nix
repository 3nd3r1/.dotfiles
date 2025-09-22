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
    xwayland.enable = true;
    systemd = {
      enable = if settings.profile == "work" then false else true;
      variables = [ "--all" ];
    };
    package = hyprlandPkg;
    portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
  };

  xdg.portal = {
    enable = true;
    config = {
      common = {
        default = [ "hyprland" ];
      };
      hyprland = {
        default = [
          "gtk"
          "hyprland"
        ];
      };
    };
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
    xdgOpenUsePortal = true;
  };
}
