{ config, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "ALT";

    # Mouse bindings.
    bindm = [ "$mod, mouse:272, movewindow" "$mod, mouse:273, resizewindow" ];

    binde = [
      ", XF86AudioRaiseVolume, exec, pulsemixer --change-volume +2"
      ", XF86AudioLowerVolume, exec, pulsemixer --change-volume -2"
      ", XF86MonBrightnessUp, exec, brightnessctl s +5%"
      ", XF86MonBrightnessDown, exec, brightnessctl s 5%-"
      "$mod ALT, k, exec, pulsemixer --change-volume +5"
      "$mod ALT, j, exec, pulsemixer --change-volume -5"
    ];

    bind = [
      # Window/Session actions.
      "$mod SHIFT, Q, killactive,"
      "$mod SHIFT, F, togglefloating,"
      "$mod SUPER, Q, exit,"

      # Dwindle
      "$mod, O, togglesplit,"
      "$mod, P, pseudo,"

      # Lock screen
      "$mod, Escape, exec, hyprlock"

      # Application shortcuts.
      "$mod, Return, exec, kitty"
      "$mod, B, exec, brave"

      # Special workspace
      "$mod, S, togglespecialworkspace"
      "$mod SHIFT, S, movetoworkspacesilent, special"

      # Launcher
      # "$mod, A, exec, rofi -show drun -kb-cancel Super_L"
      # "$mod SHIFT, A, exec, ags -t launcher"

      # Move window focus with vim keys.
      "$mod, h, movefocus, l"
      "$mod, l, movefocus, r"
      "$mod, k, movefocus, u"
      "$mod, j, movefocus, d"

      # Swap windows with vim keys
      "$mod SHIFT, h, movewindow, l"
      "$mod SHIFT, l, movewindow, r"
      "$mod SHIFT, k, movewindow, u"
      "$mod SHIFT, j, movewindow, d"

      "$mod SHIFT, c, centerwindow, 1"

      # Move monitor focus.
      "$mod, ., focusmonitor, +1"

      # Switch workspaces.
      "$mod, 1,exec,hyprworkspace 1"
      "$mod, 2,exec,hyprworkspace 2"
      "$mod, 3,exec,hyprworkspace 3"
      "$mod, 4,exec,hyprworkspace 4"
      "$mod, 5,exec,hyprworkspace 5"
      "$mod, 6,exec,hyprworkspace 6"
      "$mod, 7,exec,hyprworkspace 7"
      "$mod, 8,exec,hyprworkspace 8"
      "$mod, 9,exec,hyprworkspace 9"
      "$mod, 0,exec,hyprworkspace 10"

      "$mod CTRL, h, workspace, r-1"
      "$mod, Left, workspace, r-1"
      "$mod CTRL, l, workspace, r+1"
      "$mod, Right, workspace, r+1"

      # Scroll through monitor workspaces with mod + scroll
      "$mod, mouse_down, workspace, r-1"
      "$mod, mouse_up, workspace, r+1"
      "$mod, mouse:274, killactive,"

      # Move active window to a workspace.
      "$mod SHIFT, 1, movetoworkspace, 1"
      "$mod SHIFT, 2, movetoworkspace, 2"
      "$mod SHIFT, 3, movetoworkspace, 3"
      "$mod SHIFT, 4, movetoworkspace, 4"
      "$mod SHIFT, 5, movetoworkspace, 5"
      "$mod SHIFT, 6, movetoworkspace, 6"
      "$mod SHIFT, 7, movetoworkspace, 7"
      "$mod SHIFT, 8, movetoworkspace, 8"
      "$mod SHIFT, 9, movetoworkspace, 9"
      "$mod SHIFT, 0, movetoworkspace, 10"
      "$mod CTRL SHIFT, l, movetoworkspace, r+1"
      "$mod SHIFT, Right, movetoworkspace, r+1"
      "$mod CTRL SHIFT, h, movetoworkspace, r-1"
      "$mod SHIFT, Left, movetoworkspace, r-1"
    ];
  };
}
