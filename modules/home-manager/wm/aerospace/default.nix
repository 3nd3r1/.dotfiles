{ pkgs, ... }:
let
  workspaceHere = pkgs.writeShellScript "aerospace-workspace-here" ''
    export PATH=/opt/homebrew/bin:/usr/local/bin:$PATH
    target="$1"
    mon="$(aerospace list-monitors --focused --format '%{monitor-id}')"
    aerospace workspace "$target"
    aerospace move-workspace-to-monitor "$mon"
  '';
  lockScreen = pkgs.writeShellScript "aerospace-lock-screen" ''
    osascript -e 'tell application "System Events" to keystroke "q" using {control down, command down}'
  '';
in
{
  xdg.configFile."aerospace/aerospace.toml".text = ''
    start-at-login = true
    after-login-command = []
    after-startup-command = []

    default-root-container-layout = 'tiles'
    default-root-container-orientation = 'auto'

    [gaps]
    inner.horizontal = 8
    inner.vertical = 8
    outer.left = 8
    outer.bottom = 8
    outer.top = 8
    outer.right = 8

    [mode.main.binding]
    cmd-ctrl-alt-b = 'exec-and-forget open -a Island'
    cmd-l = 'exec-and-forget ${lockScreen}'

    cmd-ctrl-alt-slash = 'layout tiles horizontal vertical'
    cmd-ctrl-alt-f = 'fullscreen'

    cmd-ctrl-alt-shift-q = 'close'
    cmd-ctrl-alt-enter = 'exec-and-forget open -n /Applications/kitty.app'

    cmd-ctrl-alt-h = 'focus left'
    cmd-ctrl-alt-j = 'focus down'
    cmd-ctrl-alt-k = 'focus up'
    cmd-ctrl-alt-l = 'focus right'

    cmd-ctrl-alt-shift-h = 'move left'
    cmd-ctrl-alt-shift-j = 'move down'
    cmd-ctrl-alt-shift-k = 'move up'
    cmd-ctrl-alt-shift-l = 'move right'

    cmd-ctrl-alt-shift-minus = 'resize smart -50'
    cmd-ctrl-alt-shift-equal = 'resize smart +50'

    cmd-ctrl-alt-comma = 'focus-monitor --wrap-around prev'
    cmd-ctrl-alt-period = 'focus-monitor --wrap-around next'
    cmd-ctrl-alt-shift-comma = 'move-node-to-monitor --wrap-around prev'
    cmd-ctrl-alt-shift-period = 'move-node-to-monitor --wrap-around next'

    cmd-ctrl-alt-1 = 'exec-and-forget ${workspaceHere} 1'
    cmd-ctrl-alt-2 = 'exec-and-forget ${workspaceHere} 2'
    cmd-ctrl-alt-3 = 'exec-and-forget ${workspaceHere} 3'
    cmd-ctrl-alt-4 = 'exec-and-forget ${workspaceHere} 4'
    cmd-ctrl-alt-5 = 'exec-and-forget ${workspaceHere} 5'
    cmd-ctrl-alt-6 = 'exec-and-forget ${workspaceHere} 6'
    cmd-ctrl-alt-7 = 'exec-and-forget ${workspaceHere} 7'
    cmd-ctrl-alt-8 = 'exec-and-forget ${workspaceHere} 8'
    cmd-ctrl-alt-9 = 'exec-and-forget ${workspaceHere} 9'

    cmd-ctrl-alt-shift-1 = 'move-node-to-workspace 1'
    cmd-ctrl-alt-shift-2 = 'move-node-to-workspace 2'
    cmd-ctrl-alt-shift-3 = 'move-node-to-workspace 3'
    cmd-ctrl-alt-shift-4 = 'move-node-to-workspace 4'
    cmd-ctrl-alt-shift-5 = 'move-node-to-workspace 5'
    cmd-ctrl-alt-shift-6 = 'move-node-to-workspace 6'
    cmd-ctrl-alt-shift-7 = 'move-node-to-workspace 7'
    cmd-ctrl-alt-shift-8 = 'move-node-to-workspace 8'
    cmd-ctrl-alt-shift-9 = 'move-node-to-workspace 9'

    cmd-ctrl-alt-shift-semicolon = 'mode service'

    [mode.service.binding]
    esc = 'reload-config'
    r = ['flatten-workspace-tree', 'mode main']
    backspace = ['close-all-windows-but-current', 'mode main']
  '';
}
