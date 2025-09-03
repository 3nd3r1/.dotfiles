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
        # Save environment info for debugging
        "env > /tmp/hyprland_env.log"
        "echo 'DISPLAY: '$DISPLAY >> /tmp/hyprland_env.log"
        "echo 'WAYLAND_DISPLAY: '$WAYLAND_DISPLAY >> /tmp/hyprland_env.log"
        "echo 'XDG_SESSION_TYPE: '$XDG_SESSION_TYPE >> /tmp/hyprland_env.log"

        # Try launching terminal with debug output
        "foot 2>&1 > /tmp/foot_debug.log &"

        # Check if XWayland is running
        "ps aux | grep -i xwayland > /tmp/xwayland_status.log"
      ];
    };
  };
}
