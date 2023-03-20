from libqtile import widget
from libqtile.widget import Spacer
from libqtile import qtile


def init_colors():
    return [
            # 0
            ["#1d2021", "#1d2021"],
            # 1
            ["#282828", "#282828"],
            # 2-Bar Background
            ["#3c3836", "#3c3836"],
            # 3 - Text
            ["#ebdbb2", "#ebdbb2"],
            # 4
            ["#a89984", "#a89984"],
            # 5
            ["#bdae93", "#bdae93"],
            # 6- Widget text
            ["#665c54", "#665c54"],
            # 7- Bar alt
            ["#7c6f64", "#7c6f64"],
            # 8
            ["#928374", "#928374"],
            # 9 - Group Box Inactive Icon,
            ["#a89984", "#a89984"],
            # 10
            ["#ebdbb2", "#ebdbb2"],
            # 11
            ["#b16286", "#b16286"],
            # 12 - Clock and Cal Icon
            ["#fabd2f", "#fabd2f"],
            # 13- Active Screen Underline
            ["#fe8019", "#fe8019"],
            # 14 - Second Widget Color
            ["#83a598", "#83a598"],
            # 15
            ["#458588", "#458588"],
            # 16
            ["#689d6a", "#689d6a"],
            # 17 - Third Widget Color
            ["#8ec07c", "#8ec07c"],
            # 18
            ["#b8bb26", "#b8bb26"],
            # 19
            ["#fab387", "#fab387"],
            # 20 - Urgent/No Update
            ["#cc241d", "#cc241d"],
            # 21
            ["#fb4934", "#fb4934"],
            # 22 - Group Box Active Icon, first colored widget
            ["#d3869b", "#d3869b"],
            # 23
            ["#d65d0e", "#d65d0e"],
            # 24
            ["#d79921", "#d79921"],
            # 25
            ["#fbf1c7", "#fbf1c7"],
            # 26 - Transparent
            ["#FF00000", "#FF00000"]]


colors = init_colors()
