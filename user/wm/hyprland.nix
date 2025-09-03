{ inputs, config, lib, settings, pkgs, ... }:

{
  imports = [ ./hyprland/binds.nix ];

  home.packages = with pkgs; [ hyprcursor rose-pine-hyprcursor ];

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = true;
    package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    portalPackage =
      inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
    settings = {
      exec-once = [
        # Check if processes start and stay running
        "sleep 1 && ps aux > /tmp/processes_after_start.log"
        "foot &"
        "sleep 3"
        "ps aux | grep foot > /tmp/foot_processes.log"
        "hyprctl clients > /tmp/hyprland_clients.log"

        # Try multiple terminals
        "alacritty 2>&1 > /tmp/alacritty_debug.log &"
        "kitty 2>&1 > /tmp/kitty_debug.log &"

        # Test if any GUI app works
        "notify-send 'Test' 'Notification' 2>&1 > /tmp/notify_debug.log"
      ];
    };
  };
}
