{ config, pkgs, settings, ... }:

{
  wayland.windowManager.hyprland.settings = {
    "$mod" = "ALT";

    bindm = [
      "$mod, mouse:272, movewindow"
      "$mod, mouse:273, resizewindow"
    ];

    bindel = [
      ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
      ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
      ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
      ", XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
      ", XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
      ", XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
    ];

    bind = [
      "$mod SHIFT, Q, killactive,"
      "$mod SUPER, Q, exit,"
      "$mod SHIFT, F, togglefloating,"
      # "$mod, W, fullscreen, 1"
      # "$mode SHIFT, W, fullscreen,"

      # Dwindle
      # "$mod, O, togglesplit,"
      # "$mod, P, pseudo,"

      # Lock screen
      "SUPER, L, exec, hyprlock"

      # Application shortcuts.
      "$mod, Return, exec, ${settings.preferredTerminal}"
      "$mod, B, exec, ${settings.preferredBrowser}"
      "$mod, E, exec, ${settings.preferredFileManager}"

      # Launcher
      "$mod, P, exec, rofi -show drun"
      #"$mod SHIFT, A, exec, ags -t launcher"

      # Screenshot
      # "$mod SHIFT, z, exec, wl-copy < $(grimshot --notify save area $XDG_PICTURES_DIR/Screenshots/$(TZ=utc date +'screenshot_%Y-%m-%d-%H%M%S.%3N.png'))"

      # Move window focus with vim keys.
      "$mod, h, cyclenext, prev"
      "$mod, l, cyclenext"
      "$mod, k, cyclenext, prev"
      "$mod, j, cyclenext"

      # Swap windows with vim keys
      "$mod SHIFT, h, movewindow, l"
      "$mod SHIFT, l, movewindow, r"
      "$mod SHIFT, k, movewindow, u"
      "$mod SHIFT, j, movewindow, d"
      "$mod SHIFT, c, centerwindow, 1"

      # Move monitor focus.
      "$mod, period, focusmonitor, +1"
      "$mod, comma, focusmonitor, -1"

      # Switch workspaces.
      "$mod, 1, focusworkspaceoncurrentmonitor, 1"
      "$mod, 2, focusworkspaceoncurrentmonitor, 2"
      "$mod, 3, focusworkspaceoncurrentmonitor, 3"
      "$mod, 4, focusworkspaceoncurrentmonitor, 4"
      "$mod, 5, focusworkspaceoncurrentmonitor, 5"
      "$mod, 6, focusworkspaceoncurrentmonitor, 6"
      "$mod, 7, focusworkspaceoncurrentmonitor, 7"
      "$mod, 8, focusworkspaceoncurrentmonitor, 8"
      "$mod, 9, focusworkspaceoncurrentmonitor, 9"

      # Scroll through monitor workspaces with mod + scroll
      "$mod, mouse_down, workspace, e+1"
      "$mod, mouse_up, workspace, e-1"

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
    ];
  };
}
