# Qtile keybindings

import os
from libqtile.config import Key
from libqtile.command import lazy


mod = "mod1"
super = "mod4"

home = os.path.expanduser("~")

keys = [Key(key[0], key[1], *key[2:]) for key in [
    # ------------ Window Configs ------------

    # Switch between windows in current stack pane
    ([mod], "j", lazy.layout.down()),
    ([mod], "k", lazy.layout.up()),
    ([mod], "h", lazy.layout.left()),
    ([mod], "l", lazy.layout.right()),

    # Change window sizes (MonadTall)
    ([mod, "shift"], "l", lazy.layout.grow()),
    ([mod, "shift"], "h", lazy.layout.shrink()),

    # Toggle floating
    ([mod, "shift"], "f", lazy.window.toggle_floating()),

    # Move windows up or down in current stack
    ([mod, "shift"], "j", lazy.layout.shuffle_down()),
    ([mod, "shift"], "k", lazy.layout.shuffle_up()),

    # Toggle between different layouts as defined below
    ([mod], "Tab", lazy.next_layout()),
    ([mod, "shift"], "Tab", lazy.prev_layout()),

    # Kill window
    ([mod, "shift"], "q", lazy.window.kill()),

    # Switch focus of monitors
    ([mod], "period", lazy.next_screen()),
    ([mod], "comma", lazy.prev_screen()),

    # Restart Qtile
    ([mod, "control"], "r", lazy.restart()),
    # ([mod, "control"], "c", lazy.shutdown()),
    ([mod], "r", lazy.spawncmd()),

    # ------------ App Configs ------------

    # Menu
    ([mod], "p", lazy.spawn("rofi -show drun")),

    # Browser+
    ([mod], "b", lazy.spawn("brave-browser")),

    # File Explorer
    ([mod], "e", lazy.spawn("nautilus")),

    # Terminal
    ([mod], "Return", lazy.spawn("st")),

    # Screenshot
    ([], "Print", lazy.spawn(home+"/.local/bin/screenshot")),

    # ------------ Hardware Configs ------------

    # Volume
    ([], "XF86AudioLowerVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ -5%"
    )),
    ([], "XF86AudioRaiseVolume", lazy.spawn(
        "pactl set-sink-volume @DEFAULT_SINK@ +5%"
    )),
    ([], "XF86AudioMute", lazy.spawn(
        "pactl set-sink-mute @DEFAULT_SINK@ toggle"
    )),

    # Brightness
    ([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    ([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),

    # System Actions
    ([mod, "shift"], "s", lazy.spawn(home+"/.local/bin/systemControl")),
    ([super], "l", lazy.spawn("i3lock-fancy")),
    ([super], "p", lazy.spawn(home+"/.local/bin/screens")),

    ([mod], "F1", lazy.spawn("st -e pulsemixer")),
    ([mod], "F2", lazy.spawn("st -e nmtui")),
    ([mod], "F3", lazy.spawn("xinput-gui")),
    ([mod], "F4", lazy.spawn("blueman-manager")),
    ([mod], "F5", lazy.spawn("arandr")),
]]
