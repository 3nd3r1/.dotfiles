{ settings, ... }:
{
  imports = [ (./styles + "/${settings.theme}.nix") ];

  programs.waybar = {
    enable = true;
    settings = [
      {
        position = "top";
        include = [ "${./modules.json}" ];
        modules-left = [
          "hyprland/workspaces"
          "custom/right-arrow-dark"
        ];
        modules-center = [
        ];
        modules-right = [
          "custom/left-arrow-dark"
          "network"
          "custom/left-arrow-dark"
          "pulseaudio"
          "custom/left-arrow-dark"
          "battery"
          "custom/left-arrow-dark"
          "clock"
          "custom/left-arrow-dark"
          "tray"
        ];
      }
    ];
    systemd.enable = true;
  };
}
