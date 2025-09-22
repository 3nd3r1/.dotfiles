{
  inputs,
  config,
  pkgs,
  ...
}:

{
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

  services.displayManager.sddm = {
    enable = true;
    wayland.enable = true;
    setupScript = ''
      # Get connected displays
      EXTERNAL=$(${pkgs.xorg.xrandr}/bin/xrandr | grep " connected" | grep -v "eDP" | head -n1 | awk '{print $1}')
      INTERNAL=$(${pkgs.xorg.xrandr}/bin/xrandr | grep "eDP" | grep " connected" | awk '{print $1}')

      # If external display is connected, use it as primary and turn off internal
      if [ -n "$EXTERNAL" ]; then
        ${pkgs.xorg.xrandr}/bin/xrandr --output "$EXTERNAL" --primary --auto
        if [ -n "$INTERNAL" ]; then
          ${pkgs.xorg.xrandr}/bin/xrandr --output "$INTERNAL" --off
        fi
      fi
    '';
  };

  programs = {
    hyprland = {
      enable = true;
      package = inputs.hyprland.packages.${pkgs.system}.hyprland;
      portalPackage = inputs.hyprland.packages.${pkgs.system}.xdg-desktop-portal-hyprland;
    };
  };
}
