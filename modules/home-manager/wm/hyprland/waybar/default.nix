{ settings, themeDetails, ... }:
let
  baseCSS = ''
    * {
      font-family: ${themeDetails.font.name};
      font-size: ${toString themeDetails.font.size}px;
    }
  '';
in

{
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
          "time"
          "custom/left-arrow-dark"
          "tray"
        ];
      }
    ];
    style = baseCSS + builtins.readFile (./styles + "/${settings.theme}.css");
    systemd.enable = true;
  };
}
