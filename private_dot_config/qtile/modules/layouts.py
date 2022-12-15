from libqtile import layout
from libqtile.config import Match
from .widgets import colors

def init_layout_theme():
    return {
            "margin": 3,
            "border_width": 3,
            "border_focus": '#5e81ac',
            "border_normal": '#4c566a'
            }

layout_theme = init_layout_theme()

layouts = [
    layout.Columns(**layout_theme),
    # layout.Max(**layout_theme),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2, **layout_theme),
    # layout.Bsp(**layout_theme),
    # layout.Matrix(**layout_theme),
    # layout.MonadTall(**layout_theme),
    # layout.MonadWide(**layout_theme),
    # layout.RatioTile(**layout_theme),
    # layout.Tile(**layout_theme),
    #layout.TreeTab(
    #    sections=['FIRST', 'SECOND'],
    #    bg_color='#3b4252',
    #    active_bg='#bf616a',
    #    inactive_bg='#a3be8c',
    #    padding_y=5,
    #    section_top=10,
    #    panel_width=280
    #),
    layout.VerticalTile(**layout_theme),
    # layout.Zoomy(),
]

floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
    Match(wm_class='zoom'),  # GPG key password entry
    Match(wm_class='gsimplecal'),  # GPG key password entry
    Match(wm_class='zhumuintl'),  # GPG key password entry
    Match(wm_class='copyq'),  # GPG key password entry
    Match(title='Library'),  # GPG key password entry
    ],
    border_focus=colors[12] [0]
)
