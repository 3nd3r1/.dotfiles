{ settings, ... }:
let
  profileConfigs = {
    work = {
      workspace = [
        "6, on-created-empty:teams-for-linux"
      ];

      windowrulev2 = [
        "workspace 6 silent, class:^(teams-for-linux)$"
        "workspace 6 silent, title:^(Microsoft Teams)(.*)$"
        "workspace 6 silent, class:^(evolution)$"
      ];

      exec-once = [
        "teams-for-linux"
        "evolution"
      ];
    };

    laptop = {
      workspace = [ ];
      windowrulev2 = [ ];
      exec-once = [ ];
    };
  };

  currentProfileConfig =
    profileConfigs.${settings.profile} or {
      workspace = [ ];
      windowrulev2 = [ ];
      exec-once = [ ];
    };
in
{
  wayland.windowManager.hyprland.settings = {
    inherit (currentProfileConfig) workspace windowrulev2 exec-once;
  };
}
