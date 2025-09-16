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
          "custom/left-arrow-1"
          "cpu"
          "custom/left-arrow-2"
          "network"
          "custom/left-arrow-3"
          "pulseaudio"
          "custom/left-arrow-4"
          "battery"
          "custom/left-arrow-5"
          "clock"
          "custom/left-arrow-6"
          "tray"
        ];
      }
    ];
    systemd.enable = true;
  };
}
