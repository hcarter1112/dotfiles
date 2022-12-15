from libqtile.config import Group, Match
from .keys import *
from .layouts import layouts

groups = [
    Group("", layout="columns",        matches=[Match(wm_class=[])]),
    Group("", layout="verticaltile",  matches=[Match(wm_class=[])]),
    Group("", layout="columns",  matches=[Match(wm_class=[])]),
    Group("", layout="verticaltile",  matches=[Match(wm_class=[])]),
    Group("", layout="columns",        matches=[Match(wm_class=[])]),
    Group("", layout="verticaltile"),
    Group("", layout="columns",        matches=[Match(wm_class=[]), Match(title=[])]),
    Group("", layout="verticaltile"),
]

for k, group in zip(["1", "2", "3", "4", "5", "6", "7", "8"], groups):
    keys.append(Key("M-"+(k), lazy.group[group.name].toscreen()))
    keys.append(Key("M-S-"+(k), lazy.window.togroup(group.name)))
