from libqtile.config import EzKey as Key
from .mouse import *

terminal = "kitty"
explorer = "pcmanfm"
browser = "firefox"
emacs = "emacsclient -c -a 'emacs'"

keys = [
    # Switch between windows
    Key("M-o", lazy.next_screen(), desc="Move focus to left"),
    Key("M-h", lazy.layout.left(), desc="Move focus to left"),
    Key("M-l", lazy.layout.right(), desc="Move focus to right"),
    Key("M-j", lazy.layout.down(), desc="Move focus down"),
    Key("M-k", lazy.layout.up(), desc="Move focus up"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key("M-S-h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key("M-S-l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key("M-S-j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key("M-S-k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key("M-C-h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key("M-C-l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key("M-C-j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key("M-C-k", lazy.layout.grow_up(), desc="Grow window up"),
    Key("M-n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key("M-<space>", lazy.hide_show_bar(),
        desc="Toggle the bar"),
    Key("M-S-<space>", lazy.window.toggle_floating(), desc="Toggle Floating"),
    Key("M-t", lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack"),
    Key("M-S-t", lazy.window.toggle_fullscreen(), desc="Toggle Fullscreen"),

    # Toggle keyboard layouts
    Key("M-S-<Tab>", lazy.widget["keyboardlayout"].next_keyboard(), desc="toggle keyboard layouts"),
    # Toggle between different layouts as defined below
    Key("M-<Tab>", lazy.next_layout(), desc="Toggle between layouts"),
    # Key("M-w", lazy.window.kill(), desc="Kill focused window"),
    Key("M-C-r", lazy.restart(), desc="Restart Qtile"),
    Key("M-C-q", lazy.shutdown(), desc="Shutdown Qtile"),

    # Keybindings to launch user defined programs
    ### Rofi
    # Key("M-C-<Return>", lazy.spawn("/home/ralldi/.config/rofi/scripts/window_t2"), desc="Rofi Window Changer"),
    # Key("M-S-<Return>", lazy.spawn("/home/ralldi/.config/rofi/scripts/launcher_t2"), desc="Rofi Launcher"),
    # Key("M-S-c", lazy.spawn("/home/ralldi/.config/rofi/scripts/calc_t2"), desc="Rofi Calculator"),
    # Key("M-m", lazy.spawn("/home/ralldi/.config/rofi/scripts/emoji_t2"), desc="Rofi emoji picker"),

    ### Lock screen
    # Key("M-S-x", lazy.spawn("/home/ralldi/.config/scripts/betterlock.sh"), desc="Lock Screen and turn off dispay"),

    ### Terminal and Emacs
    # Key("M-<Return>", lazy.spawn(terminal), desc="Launch terminal"),
    # Key("M-S-e", lazy.spawn(emacs), desc="Launch Emacs Client"),
    # Key("M-C-e", lazy.spawn("emacs --with-profile legacy"), desc="Launch Emacs Client"),

    ### Work
    # Key("M-z", lazy.spawn("flatpak run com.obsproject.Studio"), desc="Launch OBS"),
    # Key("M-a", lazy.spawn("flatpak run md.obsidian.Obsidian"), desc="Launch Obsidian"),
    # Key("M-S-z", lazy.spawn("flatpak run us.zoom.Zoom"), desc="Launch Zoom"),
    # Key("M-C-z", lazy.spawn("/usr/bin/zhumuintl"), desc="Launch Zhumu"),

    # Misc
    # Key("M-e", lazy.spawn("pcmanfm"), desc="Launch file explorer"),
    # Key("M-c", lazy.spawn("gsimplecal"), desc="Launch Widget Calendar"),
    # Key("M-f", lazy.spawn("flatpak run org.ferdium.Ferdium"), desc="Launch Ferdium"),
    # Key("M-b", lazy.spawn(browser), desc="Launch default web browser"),
    # Key("M-S-s", lazy.spawn("flameshot gui"), desc="Launch flameshot screenshot utility"),
    # Key("M-S-v", lazy.spawn("copyq toggle"), desc="Launch copyq clipboard gui"),
]
