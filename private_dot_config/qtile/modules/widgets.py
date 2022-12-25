from libqtile import widget
from libqtile.widget import Spacer
from libqtile import qtile

def init_colors():
    return [["#313244", "#313244"], # color 0  dark grayish blue
            ["#45475a", "#45475a"], # color 1  dark grayish blue
            ["#585b70", "#585b70"], # color 2  very dark grayish blue
            ["#6c7086", "#6c7086"], # color 3  very dark grayish blue
            ["#7f849c", "#7f849c"], # color 4  very dark grayish blue
            ["#a6adc8", "#a6adc8"], # color 5  grayish blue
            ["#bac2de", "#bac2de"], # color 6  light grayish blue
            ["#cdd6f4", "#cdd6f4"], # color 7  light grayish blue
            ["#94e2d5", "#94e2d5"], # color 8  grayish cyan
            ["#89dceb", "#89dceb"], # color 9  desaturated cyan
            ["#74c7ec", "#74c7ec"], # color 10 desaturated blue
            ["#89b4fa", "#89b4fa"], # color 11 dark moderate blue
            ["#f38ba8", "#f38ba8"], # color 12 slightly desaturated red
            ["#fab387", "#fab387"], # color 13 desaturated red
            ["#f9e2af", "#f9e2af"], # color 14 soft orange
            ["#a6e3a1", "#a6e3a1"], # color 15 desaturated green
            ["#f2cdcd", "#f2cdcd"]] # color 16 grayish magenta

colors = init_colors()

widget_defaults = dict(
    font='Ubuntu Nerd Font',
    fontsize=15,
    padding=3,
    background=colors[1],
    foreground=colors[5]
)

extension_defaults = widget_defaults.copy()
