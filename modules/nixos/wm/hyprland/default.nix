{ pkgs, ... }:
{
  imports = [ ./regreet.nix ];

  environment.systemPackages = with pkgs; [
    wayland
    wl-clipboard
    xdg-utils
  ];

  services.xserver = {
    enable = true;
    xkb = {
      variant = "";
      layout = "fi";
    };
  };

  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };
}
