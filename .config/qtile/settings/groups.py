# Qtile workspaces

import socket

from libqtile.config import Key, Group
from libqtile.command import lazy
from .keys import mod, keys

groups = [Group(i) for i in ["1", "2", "3", "4", "5", "6", "7"]]

if socket.gethostname() == "elx-5cg2183zp2":
    # If office
    groups.append(Group(name="󰴢", spawn=["ms-teams", "ms-outlook"]))
    groups.append(Group(name="", spawn=["brave-browser https://notion.so/"]))
else:
    # If home
    groups.append(Group(name="󰙯", spawn=["ms-teams", "ms-outlook"]))
    groups.append(Group(name="", spawn=["brave-browser https://youtube.com/"]))

for i, group in enumerate(groups):
    actual_key = str(i+1)
    keys.extend([
        # Switch to workspace N
        Key([mod], actual_key, lazy.group[group.name].toscreen()),
        # Send window to workspace N
        Key([mod, "shift"], actual_key, lazy.window.togroup(group.name))
    ])
