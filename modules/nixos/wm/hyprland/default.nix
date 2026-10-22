{ pkgs, ... }:
{
  imports = [ ./regreet.nix ];

  boot.kernel.sysctl."kernel.yama.ptrace_scope" = 0;

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

  programs.hyprland.enable = true;
}
