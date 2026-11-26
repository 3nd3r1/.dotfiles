{
  inputs,
  pkgs,
  ...
}:
let
  homeManagerModulesPath = "${inputs.self}/modules/home-manager";
  hyprlandPkg = pkgs.hyprland;
in
{
  imports = [
    ./settings.nix
    ./keybinds.nix
    ./rules.nix

    ./waybar
    ./hyprpaper
    ./hyprlock
    ./hypridle
    ./swaync

    ./scripts/power-menu.nix

    "${homeManagerModulesPath}/apps/rofi"
    "${homeManagerModulesPath}/apps/grimshot.nix"
  ];

  home.packages = with pkgs; [
    brightnessctl
  ];

  services = {
    hyprpolkitagent.enable = true;
    cliphist.enable = true;
    wl-clip-persist.enable = true;
    hyprsunset = {
      enable = true;
      settings = {
        max-gamma = 150;
        profile = [
          {
            time = "7:30";
            identity = true;
          }
          {
            time = "21:00";
            temperature = 4500;
          }
        ];
      };
    };
  };

  wayland.windowManager.hyprland = {
    enable = true;
    configType = "lua";
    xwayland.enable = true;
    systemd = {
      enable = true;
      variables = [ "--all" ];
    };
    package = hyprlandPkg;
    portalPackage = pkgs.xdg-desktop-portal-hyprland;
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
