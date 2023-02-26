from libqtile import widget
from libqtile.widget import Spacer
from libqtile import qtile

def init_colors():
    return [
            ["#11111b", "#11111b"], # 0 Crust
            ["#181825", "#181825"], # 1 Mantle
            ["#1e1e2e", "#1e1e2e"], # 2 Base
            ["#cdd6f4", "#cdd6f4"], # 3 Text
            ["#a6adc8", "#a6adc8"], # 4 Subtext0
            ["#bac2de", "#bac2de"], # 5 Subtext1
            ["#313244", "#313244"], # 6 Surface0
            ["#45475a", "#45475a"], # 7 Surface1
            ["#585b70", "#585b70"], # 8 Surface2
            ["#6c7086", "#6c7086"], # 9 Overlay0
            ["#7f849c", "#7f849c"], # 10 Overlay1
            ["#9399b2", "#9399b2"], # 11 Overlay2
            ["#b4befe", "#b4befe"], # 12 Lavender
            ["#89b4fa", "#89b4fa"], # 13 Blue
            ["#74c7ec", "#74c7ec"], # 14 Saphire
            ["#89dceb", "#89dceb"], # 15 Sky
            ["#94e2d5", "#94e2d5"], # 16 Teal
            ["#a6e3a1", "#a6e3a1"], # 17 Green
            ["#f9e2af", "#f9e2af"], # 18 Yellow
            ["#fab387", "#fab387"], # 19 Peach
            ["#eba0ac", "#eba0ac"], # 20 Maroon
            ["#f38ba8", "#f38ba8"], # 21 Red
            ["#cba6f7", "#cba6f7"], # 22 Mauve
            ["#f5c2e7", "#f5c2e7"], # 23 Pink
            ["#f2cdcd", "#f2cdcd"], # 24 Flamingo
            ["#f5e0dc", "#f5e0dc"], # 25 Rosewater
            ["#FF00000", "#FF00000"]] # 26 Transparent

colors = init_colors()
