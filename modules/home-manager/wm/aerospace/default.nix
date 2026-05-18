_: {
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
    alt-comma = 'layout accordion horizontal vertical'
    alt-f = 'fullscreen'

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

    alt-1 = 'workspace 1'
    alt-2 = 'workspace 2'
    alt-3 = 'workspace 3'
    alt-4 = 'workspace 4'
    alt-5 = 'workspace 5'

    alt-shift-1 = 'move-node-to-workspace 1'
    alt-shift-2 = 'move-node-to-workspace 2'
    alt-shift-3 = 'move-node-to-workspace 3'
    alt-shift-4 = 'move-node-to-workspace 4'
    alt-shift-5 = 'move-node-to-workspace 5'

    alt-shift-semicolon = 'mode service'

    [mode.service.binding]
    esc = 'reload-config'
    r = ['flatten-workspace-tree', 'mode main']
    backspace = ['close-all-windows-but-current', 'mode main']
  '';
}
