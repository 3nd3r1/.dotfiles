{ lib, settings, ... }:
let
  inherit (lib.generators) mkLuaInline;

  workspaceOn = ws: match: {
    inherit match;
    workspace = "${toString ws} silent";
  };

  profileRules = {
    work = {
      window_rule = [
        (workspaceOn 6 { class = "^(teams-for-linux)$"; })
        (workspaceOn 6 { title = "^(Microsoft Teams)(.*)$"; })
        (workspaceOn 6 { class = "^(Evolution)$"; })
      ];
      exec-once = [
        "teams-for-linux"
        "evolution"
      ];
    };

    laptop = {
      window_rule = [
        (workspaceOn 6 { class = "^(vesktop)$"; })
      ];
      exec-once = [
        "vesktop"
      ];
    };
  };

  currentProfileRules =
    profileRules.${settings.profile} or {
      window_rule = [ ];
      exec-once = [ ];
    };

  execOnce = [
    "brave --new-window --app=https://notion.so/"
  ]
  ++ currentProfileRules.exec-once;
in
{
  wayland.windowManager.hyprland.settings = {
    window_rule = [
      {
        name = "fix-xwayland-drags";
        match = {
          class = "^$";
          title = "^$";
          xwayland = true;
          float = true;
          fullscreen = false;
          pin = false;
        };
        no_focus = true;
      }

      (workspaceOn 7 { class = "^(brave-notion.so__-Default)$"; })
    ]
    ++ currentProfileRules.window_rule;

    workspace_rule = map (ws: {
      workspace = toString ws;
      persistent = true;
    }) (lib.range 1 9);

    on = {
      _args = [
        "hyprland.start"
        (mkLuaInline ''
          function()
          ${lib.concatMapStrings (cmd: "  hl.exec_cmd(${lib.generators.toLua { } cmd})\n") execOnce}end'')
      ];
    };
  };
}
