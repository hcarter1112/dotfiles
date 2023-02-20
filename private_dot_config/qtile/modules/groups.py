from libqtile.config import Group, Match, ScratchPad, DropDown, Key
from libqtile.lazy import lazy
from libqtile import qtile
from .keys import *
from .layouts import layouts

groups = [
    Group(name="1", label="", layout="columns"),
    Group(name="2", label="", layout="columns"),
    Group(name="3", label="龎", layout="columns"),
    Group(name="4", label="", layout="columns"),
    Group(name="5", label="󰖟", layout="columns"),
    Group(name="6", label="", layout="columns"),
    Group(name="7", label="辶", layout="verticaltile"),
    Group(name="8", label="輸", layout="verticaltile"),
]

def go_to_group(name: str) -> callable:
    def _inner(qtile: qtile) -> None:
        if len(qtile.screens) == 1:
            qtile.groups_map[name].cmd_toscreen()
            return

        if name in '123456':
            qtile.focus_screen(0)
            qtile.groups_map[name].cmd_toscreen()
        else:
            qtile.focus_screen(1)
            qtile.groups_map[name].cmd_toscreen()

    return _inner

keys.append(Key("M-1", lazy.function(go_to_group("1")))),
keys.append(Key("M-2", lazy.function(go_to_group("2")))),
keys.append(Key("M-3", lazy.function(go_to_group("3")))),
keys.append(Key("M-4", lazy.function(go_to_group("4")))),
keys.append(Key("M-5", lazy.function(go_to_group("5")))),
keys.append(Key("M-6", lazy.function(go_to_group("6")))),
keys.append(Key("M-A-1", lazy.function(go_to_group("7")))),
keys.append(Key("M-A-2", lazy.function(go_to_group("8")))),

keys.append(Key("M-S-1", lazy.window.togroup("1"))),
keys.append(Key("M-S-2", lazy.window.togroup("2"))),
keys.append(Key("M-S-3", lazy.window.togroup("3"))),
keys.append(Key("M-S-4", lazy.window.togroup("4"))),
keys.append(Key("M-S-5", lazy.window.togroup("5"))),
keys.append(Key("M-S-6", lazy.window.togroup("6"))),
keys.append(Key("M-S-A-1", lazy.window.togroup("7"))),
keys.append(Key("M-S-A-2", lazy.window.togroup("8"))),
 # for k, group in zip(["1", "2", "3", "4", "5", "6", "7", "8","9"], groups):
#     keys.append(Key("M-"+(k), lazy.group[group.name].toscreen()))
#     keys.append(Key("M-S-"+(k), lazy.window.togroup(group.name)))

# Scratchpad groups
groups.append(ScratchPad('scratchpad', [
    DropDown('term', 'kitty', width=0.5, height=0.5, x=0.25, y=0.2, opacity=1),
    DropDown('htop', 'kitty htop', width=0.5, height=0.5, x=0.25, y=0.2, opacity=0.85),
    DropDown('pulsemixer', 'kitty  pulsemixer', width=0.5, height=0.5, x=0.25, y=0.2, opacity=0.85),
    DropDown('ncspot', 'kitty  ncspot', width=0.7, height=0.7, x=0.15, y=0.15, opacity=0.85),
    DropDown('ranger', 'kitty  ranger', width=0.7, height=0.7, x=0.15, y=0.15, opacity=0.8),
    DropDown('calc', 'kitty qalc', width=0.5, height=0.5, x=0.25, y=0.2, opacity=0.85),
]))

# Scratchpad Keybinds
keys.append(Key("A-<Return>", lazy.group['scratchpad'].dropdown_toggle('term'))),
keys.append(Key("C-S-1", lazy.group['scratchpad'].dropdown_toggle('htop'))),
keys.append(Key("C-S-2", lazy.group['scratchpad'].dropdown_toggle('pulsemixer'))),
keys.append(Key("C-S-3", lazy.group['scratchpad'].dropdown_toggle('ncspot'))),
keys.append(Key("C-S-4", lazy.group['scratchpad'].dropdown_toggle('ranger'))),
keys.append(Key("C-S-5", lazy.group['scratchpad'].dropdown_toggle('calc'))),
