from libqtile import widget
from libqtile.widget import Spacer
from libqtile import qtile


def init_colors():
    return [
            # 0 -Bar Background
            ["#161616", "#161616"],
            # 1 - Bar alt
            ["#6e6f70", "#6e6f70"],
            # 2 - Text
            ["#f2f4f8", "#f2f4f8"],
            # 3 - Widget text
            ["#282828", "#282828"],
            # 4 - Clock and Cal Icon
            ["#52bdff", "#52bdff"],
            # 5 - Group Box Active Icon
            ["#be95ff", "#be95ff"],
            # 6 - Group Box Inactive Icon
            ["#e4e4e5", "#e4e4e5"],
            # 7 - Active Screen Underline
            ["#33b1ff", "#33b1ff"],
            # 8 - Accent Color
            ["#46c880", "#46c880"],
            # 9 - Accent Color
            ["#f16da6", "#f16da6"],
            # 10 - Accent Color
            ["#c8a5ff", "#c8a5ff"],
            # 11 - Accent Color
            ["#8cb6ff", "#8cb6ff"],
            ]


colors = init_colors()

# background #161616
# foreground #f2f4f8
# selection_background #2a2a2a
# selection_foreground #f2f4f8
# url_color #25be6a
# 
# # Cursor
# # uncomment for reverse background
# # cursor none
# cursor #f2f4f8
# 
# # Border
# active_border_color #78a9ff
# inactive_border_color #535353
# bell_border_color #3ddbd9
# 
# # Tabs
# active_tab_background #78a9ff
# active_tab_foreground #0c0c0c
# inactive_tab_background #2a2a2a
# inactive_tab_foreground #6e6f70
# 
# # normal
# color0 #282828
# color1 #ee5396
# color2 #25be6a
# color3 #08bdba
# color4 #78a9ff
# color5 #be95ff
# color6 #33b1ff
# color7 #dfdfe0
# 
# # bright
# color8 #484848
# color9 #f16da6
# color10 #46c880
# color11 #2dc7c4
# color12 #8cb6ff
# color13 #c8a5ff
# color14 #52bdff
# color15 #e4e4e5
# 
# # extended colors
# color16 #3ddbd9
# color17 #ff7eb6
