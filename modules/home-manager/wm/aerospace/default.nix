{ pkgs, ... }:
let
  workspaceHere = pkgs.writeShellScript "aerospace-workspace-here" ''
    export PATH=/opt/homebrew/bin:/usr/local/bin:$PATH
    target="$1"
    mon="$(aerospace list-monitors --focused --format '%{monitor-id}')"
    aerospace workspace "$target"
    aerospace move-workspace-to-monitor "$mon"
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
    alt-slash = 'layout tiles horizontal vertical'
    alt-f = 'fullscreen'

    alt-q = 'close'
    alt-enter = 'exec-and-forget open -n /Applications/kitty.app'

    alt-h = 'focus left'
    alt-j = 'focus down'
    alt-k = 'focus up'
    alt-l = 'focus right'

    alt-shift-h = 'move left'
    alt-shift-j = 'move down'
    alt-shift-k = 'move up'
    alt-shift-l = 'move right'

    alt-shift-minus = 'resize smart -50'
    alt-shift-equal = 'resize smart +50'

    alt-comma = 'focus-monitor --wrap-around prev'
    alt-period = 'focus-monitor --wrap-around next'
    alt-shift-comma = 'move-node-to-monitor --wrap-around prev'
    alt-shift-period = 'move-node-to-monitor --wrap-around next'

    alt-1 = 'exec-and-forget ${workspaceHere} 1'
    alt-2 = 'exec-and-forget ${workspaceHere} 2'
    alt-3 = 'exec-and-forget ${workspaceHere} 3'
    alt-4 = 'exec-and-forget ${workspaceHere} 4'
    alt-5 = 'exec-and-forget ${workspaceHere} 5'
    alt-6 = 'exec-and-forget ${workspaceHere} 6'
    alt-7 = 'exec-and-forget ${workspaceHere} 7'
    alt-8 = 'exec-and-forget ${workspaceHere} 8'
    alt-9 = 'exec-and-forget ${workspaceHere} 9'

    alt-shift-1 = 'move-node-to-workspace 1'
    alt-shift-2 = 'move-node-to-workspace 2'
    alt-shift-3 = 'move-node-to-workspace 3'
    alt-shift-4 = 'move-node-to-workspace 4'
    alt-shift-5 = 'move-node-to-workspace 5'
    alt-shift-6 = 'move-node-to-workspace 6'
    alt-shift-7 = 'move-node-to-workspace 7'
    alt-shift-8 = 'move-node-to-workspace 8'
    alt-shift-9 = 'move-node-to-workspace 9'

    alt-shift-semicolon = 'mode service'

    [mode.service.binding]
    esc = 'reload-config'
    r = ['flatten-workspace-tree', 'mode main']
    backspace = ['close-all-windows-but-current', 'mode main']
  '';
}
