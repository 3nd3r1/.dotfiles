{ inputs, config, pkgs, ... }:

{
  environment.systemPackages = [ pkgs.wayland pkgs.wl-clipboard ];

  services.xserver.enable = false;

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
  };

  programs = {
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
  };
}
