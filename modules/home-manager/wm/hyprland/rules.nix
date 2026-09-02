{ settings, ... }:
let
  profileRules = {
    work = {
      workspace = [ ];
      windowrule = [
        "workspace 6 silent, match:class ^(teams-for-linux)$"
        "workspace 6 silent, match:title ^(Microsoft Teams)(.*)$"
        "workspace 6 silent, match:class ^(Evolution)$"
      ];
      exec-once = [
        "teams-for-linux"
        "evolution"
      ];
    };

    laptop = {
      workspace = [ ];
      windowrule = [
        "workspace 6 silent, match:class ^(vesktop)$"
      ];
      exec-once = [
        "vesktop"
      ];
    };
  };

  currentProfileRules =
    profileRules.${settings.profile} or {
      workspace = [ ];
      windowrule = [ ];
      exec-once = [ ];
    };
in
{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "no_focus on, match:class ^$, match:title ^$, match:xwayland 1, match:float 1, match:fullscreen 0, match:pin 0"

      "workspace 7 silent, match:class ^(brave-notion.so__-Default)$"
    ]
    ++ currentProfileRules.windowrule;

    workspace = [
      "1, persistent:true"
      "2, persistent:true"
      "3, persistent:true"
      "4, persistent:true"
      "5, persistent:true"
      "6, persistent:true"
      "7, persistent:true"
      "8, persistent:true"
      "9, persistent:true"
    ]
    ++ currentProfileRules.workspace;

    exec-once = [
      "brave --new-window --app=https://notion.so/"
    ]
    ++ currentProfileRules.exec-once;
  };
}
