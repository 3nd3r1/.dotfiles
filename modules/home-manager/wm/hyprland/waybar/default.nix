{ settings, themeDetails, ... }:
let
  baseCSS = ''
    * {
      font-family: "${themeDetails.font.name}";
      font-size: ${toString (themeDetails.font.size + 5)}px;
    }
  '';
in
{
  programs.waybar = {
    enable = true;
    systemd.enable = true;
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
          "custom/left-arrow-7"
          "custom/notification"
        ];
      }
    ];
    style = baseCSS + builtins.readFile (./styles + "/${settings.theme}.css");
  };
}
