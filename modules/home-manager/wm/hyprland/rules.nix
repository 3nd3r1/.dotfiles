{ settings, ... }:
let
  profileRules = {
    work = {
      workspace = [
        "6, on-created-empty:teams-for-linux"
        "6, on-created-empty:evolution"
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
      workspace = [
        "6, on-created-empty:vesktop"
      ];
      windowrulev2 = [
        "workspace 6 silent, class:^(vesktop)$"
      ];
      exec-once = [ "vesktop" ];
    };
  };

  currentProfileRules =
    profileRules.${settings.profile} or {
      workspace = [ ];
      windowrulev2 = [ ];
      exec-once = [ ];
    };
in
{
  wayland.windowManager.hyprland.settings = {
    windowrule = [
      "suppressevent maximize, class:.*"
      "nofocus,class:^$,title:^$,xwayland:1,floating:1,fullscreen:0,pinned:0"
    ];

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
      "7, on-created-empty:${settings.preferredBrowser} --new-window https://notion.so/"
    ]
    ++ currentProfileRules.workspace;
    windowrulev2 = [ ] ++ currentProfileRules.windowrulev2;
    exec-once = [ ] ++ currentProfileRules.exec-once;
  };
}
