{
  inputs,
  pkgs,
  ...
}:
let
  homeManagerModulesPath = "${inputs.self}/modules/home-manager";
  hyprlandPkg = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.hyprland;
in
{
  imports = [
    ./settings.nix
    ./keybinds.nix
    ./rules.nix

    ./waybar
    ./hyprpaper
    ./hyprlock
    ./swaync

    ./scripts/power-menu.nix

    "${homeManagerModulesPath}/apps/rofi"
    "${homeManagerModulesPath}/apps/grimshot.nix"
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    systemd = {
      enable = true;
      variables = [ "--all" ];
    };
    package = hyprlandPkg;
    portalPackage =
      inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.xdg-desktop-portal-hyprland;
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
