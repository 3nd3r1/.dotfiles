# Qtile Config File
# http://www.qtile.org/

import subprocess
from os import path

from dotenv import load_dotenv
from settings.path import qtile_path

if path.isfile(path.join(qtile_path, "local.env")):
    load_dotenv(path.join(qtile_path, "local.env"))


from libqtile import hook
from libqtile.lazy import lazy
from settings.groups import groups
from settings.keys import keys, mod
from settings.layouts import floating_layout, layouts
from settings.mouse import mouse
from settings.screens import screens
from settings.widgets import extension_defaults, widget_defaults


@hook.subscribe.startup_once
def autostart():
    subprocess.call([path.join(qtile_path, "autostart.sh")])


@hook.subscribe.shutdown
def shutdown():
    subprocess.call([path.join(qtile_path, "shutdown.sh")])


main = None
dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
cursor_warp = True
auto_fullscreen = True
focus_on_window_activation = "urgent"
wmname = "qtile"
