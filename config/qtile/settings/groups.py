# Qtile workspaces

import os

from libqtile.config import Key, Group, Match
from libqtile.lazy import lazy
from .keys import mod, keys

groups = []
for i in range(1, 10):
    name = os.getenv(f"GROUP_{str(i)}_ICON", str(i))
    spawn = [process for process in os.getenv(f"GROUP_{str(i)}_STARTUP_APPS", "").split(',') if process != ""]
    matches = [Match(wm_class=wm_class) for wm_class in os.getenv(f"GROUP_{str(i)}_MATCHES", "").split(',') if wm_class != ""]
    groups.append(Group(name, spawn=spawn, matches=matches))


for i, group in enumerate(groups):
    actual_key = str(i+1)
    keys.extend([
        # Switch to workspace N
        Key([mod], actual_key, lazy.group[group.name].toscreen()),
        # Send window to workspace N
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    ])
