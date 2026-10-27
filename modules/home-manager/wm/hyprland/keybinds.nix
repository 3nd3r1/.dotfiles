{
  lib,
  settings,
  ...
}:
let
  inherit (lib.generators) mkLuaInline;

  mod = "ALT";

  bind = keys: dispatcher: {
    _args = [
      keys
      (mkLuaInline dispatcher)
    ];
  };
  bindFlags = keys: dispatcher: flags: {
    _args = [
      keys
      (mkLuaInline dispatcher)
      flags
    ];
  };
  exec = keys: cmd: bind keys "hl.dsp.exec_cmd(${lib.generators.toLua { } cmd})";
  # bindel: repeat while held, works on lockscreen
  repeatExec =
    keys: cmd:
    bindFlags keys "hl.dsp.exec_cmd(${lib.generators.toLua { } cmd})" {
      repeating = true;
      locked = true;
    };

  directions = {
    h = "left";
    l = "right";
    k = "up";
    j = "down";
  };

  resizes = {
    h = "x = -50, y = 0";
    l = "x = 50, y = 0";
    k = "x = 0, y = -50";
    j = "x = 0, y = 50";
  };

  workspaces = map toString (lib.range 1 9);
in
{
  wayland.windowManager.hyprland.settings.bind = [
    (bindFlags "${mod} + mouse:272" "hl.dsp.window.drag()" { mouse = true; })
    (bindFlags "${mod} + mouse:273" "hl.dsp.window.resize()" { mouse = true; })

    (repeatExec "XF86AudioRaiseVolume" "wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+")
    (repeatExec "XF86AudioLowerVolume" "wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-")
    (repeatExec "XF86AudioMute" "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle")
    (repeatExec "XF86AudioMicMute" "wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle")
    (repeatExec "XF86MonBrightnessUp" "brightnessctl -e4 -n2 set 5%+")
    (repeatExec "XF86MonBrightnessDown" "brightnessctl -e4 -n2 set 5%-")

    (bind "${mod} + SHIFT + Q" "hl.dsp.window.close()")
    (bind "${mod} + SUPER + Q" "hl.dsp.exit()")
    (bind "${mod} + SHIFT + F" "hl.dsp.window.float({ action = \"toggle\" })")
    (bind "${mod} + TAB" "hl.dsp.window.fullscreen()")

    # Lock screen
    (exec "SUPER + L" "hyprlock")

    # Application shortcuts.
    (exec "${mod} + Return" settings.preferredTerminal)
    (exec "${mod} + B" settings.preferredBrowser)
    (exec "${mod} + E" settings.preferredFileManager)

    # Launcher
    (exec "${mod} + P" "rofi -show drun")
    (exec "${mod} + SHIFT + S" "power-menu")

    # Screenshot
    (exec "Print" "wl-copy < $(grimshot --notify save area $HOME/Pictures/Screenshots/$(TZ=utc date +'screenshot_%Y-%m-%d-%H%M%S.%3N.png'))")

    (bind "${mod} + SHIFT + c" "hl.dsp.window.center()")

    # Move monitor focus.
    (bind "${mod} + period" "hl.dsp.focus({ monitor = \"+1\" })")
    (bind "${mod} + comma" "hl.dsp.focus({ monitor = \"-1\" })")

    # Scroll through monitor workspaces with mod + scroll
    (bind "${mod} + mouse_down" "hl.dsp.focus({ workspace = \"e+1\" })")
    (bind "${mod} + mouse_up" "hl.dsp.focus({ workspace = \"e-1\" })")
  ]
  # Move focus / swap windows with vim keys.
  ++ lib.concatLists (
    lib.mapAttrsToList (key: dir: [
      (bind "${mod} + ${key}" "hl.dsp.focus({ direction = \"${dir}\" })")
      (bind "${mod} + SHIFT + ${key}" "hl.dsp.window.move({ direction = \"${dir}\" })")
    ]) directions
  )
  # Resize windows
  ++ lib.mapAttrsToList (
    key: delta: bind "${mod} + CTRL + ${key}" "hl.dsp.window.resize({ ${delta}, relative = true })"
  ) resizes
  # Switch workspaces / move active window to a workspace.
  ++ lib.concatMap (ws: [
    (bind "${mod} + ${ws}" "hl.dsp.focus({ workspace = ${ws}, on_current_monitor = true })")
    (bind "${mod} + SHIFT + ${ws}" "hl.dsp.window.move({ workspace = ${ws} })")
  ]) workspaces;
}
