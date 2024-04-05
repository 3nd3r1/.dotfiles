# Qtile workspaces

import os

from libqtile.config import Key, Group
from libqtile.command import lazy
from libqtile.log_utils import logger
from .keys import mod, keys

groups = []
for i in range(1, 10):
    name = os.getenv(f"GROUP_{str(i)}_ICON", str(i))
    spawn = os.getenv(f"GROUP_{str(i)}_STARTUP_APPS", "").split(',')
    groups.append(Group(name, spawn=spawn if spawn[0] != "" else []))


for i, group in enumerate(groups):
    actual_key = str(i+1)
    keys.extend([
        # Switch to workspace N
        Key([mod], actual_key, lazy.group[group.name].toscreen()),
        # Send window to workspace N
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    ])
