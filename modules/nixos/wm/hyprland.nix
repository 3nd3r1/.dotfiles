{ inputs, config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.wayland pkgs.wl-clipboard ];

  services.xserver = {
    enable = true;
    xkb = {
      variant = "";
      layout = "fi";
    };
  };

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.default;
      portalPackage =
        inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
    };
  };

  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    config = { hyprland.default = [ "hyprland" ]; };

  };
}
