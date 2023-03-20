from libqtile import bar
from .widgets import *
from libqtile.config import Screen

import os

widget_defaults = dict(
    font='DroidSansMono Nerd Font',
    fontsize=15,
    padding=3,
    background=colors[0],
    foreground=colors[5]
)

extension_defaults = widget_defaults.copy()

screens = [
######## Primary Screen
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    visible_groups=['1', '2', '3', '4', '5', '6'],
                    active=colors[5],  #b48ead
                    borderwidth=2,  # Underline
                    disable_drag=True,
                    font='DroidSansMono Nerd Font',
                    fontsize=20,
                    hide_unused=False,
                    highlight_method='text',
                    inactive=colors[6],
                    margin_x=0,
                    margin_y=3,
                    padding_x=11,
                    padding_y=0,
                    rounded=False,
                    this_current_screen_border=colors[7],
                    urgent_alert_method='line'
                ),
                # widget.TextBox(
                #     background=colors[1],
                #     font='DroidSansMono Nerd Font',
                #     fontsize=30,
                #     foreground=colors[0],
                #     padding=0,
                #     text=''
                # ),
                widget.Sep(
                    foreground=colors[6],
                    padding=25,
                    linewidth=2,
                    size_percent=45
                    ),
                widget.WindowName(
                    background=colors[0],
                    foreground=colors[2],
                    font='DroidSansMono Nerd Font',
                    fontsize = 16,
                    max_chars=30
                ),
                widget.Spacer(),
                widget.TextBox(
                    background=colors[0],
                    font='DroidSansMono Nerd Font',
                    fontsize=20,
                    foreground=colors[4],
                    padding=0,
                    text=' '
                ),
                widget.Clock(
                    background=colors[0],
                    font='DroidSansMono Nerd Font Bold',
                    fontsize=22,
                    foreground=colors[4],
                    format='%a %Y-%m-%d || %I:%M:%S %p ',
                    mouse_callbacks={'Button1': lambda : qtile.cmd_spawn('gsimplecal')}
                ),
                widget.Spacer(),
                widget.Systray(
                    background=colors[0],
                    icon_size=20,
                    padding=6
                ),
                widget.Sep(
                    foreground=colors[6],
                    background=colors[0],
                    padding=25,
                    linewidth=2,
                    size_percent=45
                    ),
                widget.TextBox(
                    background=colors[0],
                    font='DroidSansMono Nerd Font',
                    fontsize=20,
                    foreground=colors[1],
                    padding=0,
                    text=' '
                ),
                widget.ThermalSensor(
                    background=colors[0],
                    font='DroidSansMono Nerd Font',
                    fontsize=15,
                    foreground=colors[1],
                    update_interval=2
                ),
                widget.Sep(
                    foreground=colors[6],
                    background=colors[0],
                    padding=25,
                    linewidth=2,
                    size_percent=45
                    ),
                widget.TextBox(
                    background=colors[0],
                    font='DroidSansMono Nerd Font',
                    fontsize=20,
                    foreground=colors[11],
                    padding=0,
                    text=' '
                ),
                widget.Memory(
                    background=colors[0],
                    font='DroidSansMono Nerd Font',
                    fontsize=15,
                    foreground=colors[11],
                    format="{MemUsed: .0f}{mm}",
                    update_interval=1.0
                ),
                widget.Sep(
                    foreground=colors[6],
                    background=colors[0],
                    padding=25,
                    linewidth=2,
                    size_percent=45
                    ),
                widget.TextBox(
                    background=colors[0],
                    font='DroidSansMono Nerd Font',
                    fontsize=20,
                    foreground=colors[1],
                    padding=0,
                    text=' '
                ),
                widget.CPU(
                    background=colors[0],
                    font='DroidSansMono Nerd Font',
                    fontsize=15,
                    foreground=colors[1],
                    format='CPU {load_percent}%',
                    update_interval=1
                ),
                widget.Sep(
                    foreground=colors[6],
                    background=colors[0],
                    padding=25,
                    linewidth=2,
                    size_percent=45
                    ),
                widget.TextBox(
                    background=colors[0],
                    font='DroidSansMono Nerd Font',
                    fontsize=30,
                    foreground=colors[11],
                    padding=0,
                    text=' ﮮ'
                ),
                widget.CheckUpdates(
                    background=colors[0],
                    font='DroidSansMono Nerd Font',
                    fontsize=15,
                    foreground=colors[11],
                    colour_no_updates=colors[10],
                    colour_have_updates=colors[11],
                    no_update_string='None',
                    display_format='{updates}',
                    distro='Arch_checkupdates',
                    initial_text='...',
                    update_interval=600
                ),
                widget.Sep(
                    foreground=colors[6],
                    background=colors[0],
                    padding=25,
                    linewidth=2,
                    size_percent=45
                    ),
                widget.TextBox(
                    background=colors[0],
                    font='DroidSansMono Nerd Font',
                    fontsize=20,
                    foreground=colors[1],
                    padding=0,
                    text=' '
                ),
                widget.KeyboardLayout(
                    background=colors[0],
                    font='DroidSansMono Nerd Font',
                    fontsize=15,
                    foreground=colors[1]
                ),
                widget.CapsNumLockIndicator(
                    background=colors[0],
                    font='DroidSansMono Nerd Font',
                    fontsize=15,
                    foreground=colors[1]
                ),
                widget.Sep(
                    foreground=colors[6],
                    background=colors[0],
                    padding=25,
                    linewidth=2,
                    size_percent=45
                    ),
                widget.CurrentLayoutIcon(
                    background=colors[0],
                    custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
                    foreground=colors[0], #e5e9f0
                    padding=5,
                    scale=0.65
                ),
            ],
            28,
            margin=[0, 0, 3, 0],
            opacity=1
        ),
    ),
    ######## Portrait bar (Aux Screen)
    Screen(
        top=bar.Bar(
            [
                widget.GroupBox(
                    visible_groups=['7', '8'],
                    active=colors[5], #b48ead
                    borderwidth=2,  # Underline
                    disable_drag=True,
                    font='DroidSansMono Nerd Font',
                    fontsize=20,
                    hide_unused=False,
                    highlight_method='text',
                    inactive=colors[6],
                    margin_x=0,
                    margin_y=3,
                    padding_x=11,
                    padding_y=0,
                    rounded=False,
                    this_current_screen_border=colors[7],
                    urgent_alert_method='line'
                ),
                widget.Sep(
                    foreground=colors[6],
                    padding=25,
                    linewidth=2,
                    size_percent=45
                    ),
                widget.WindowName(
                    background=colors[0],
                    foreground=colors[2],
                    font='DroidSansMono Nerd Font',
                    fontsize = 16,
                    max_chars=30
                ),
                widget.Spacer(),
                widget.TextBox(
                    background=colors[0],
                    font='DroidSansMono Nerd Font',
                    fontsize=20,
                    foreground=colors[4],
                    padding=0,
                    text=' '
                ),
                widget.Clock(
                    background=colors[0],
                    font='DroidSansMono Nerd Font Bold',
                    fontsize=22,
                    foreground=colors[4],
                    format='%a %Y-%m-%d || %I:%M:%S %p ',
                    mouse_callbacks={'Button1': lambda : qtile.cmd_spawn('gsimplecal')}
                ),
                widget.Spacer(),
                widget.TextBox(
                    background=colors[0],
                    font='DroidSansMono Nerd Font',
                    fontsize=20,
                    foreground=colors[1],
                    padding=0,
                    text=' '
                ),
                widget.ThermalSensor(
                    background=colors[0],
                    font='DroidSansMono Nerd Font',
                    fontsize=15,
                    foreground=colors[1],
                    update_interval=2
                ),
                widget.Sep(
                    foreground=colors[6],
                    background=colors[0],
                    padding=25,
                    linewidth=2,
                    size_percent=45
                    ),
                widget.TextBox(
                    background=colors[0],
                    font='DroidSansMono Nerd Font',
                    fontsize=20,
                    foreground=colors[11],
                    padding=0,
                    text=' '
                ),
                widget.Memory(
                    background=colors[0],
                    font='DroidSansMono Nerd Font',
                    fontsize=15,
                    foreground=colors[11],
                    format="{MemUsed: .0f}{mm}",
                    update_interval=1.0
                ),
                widget.Sep(
                    foreground=colors[6],
                    background=colors[0],
                    padding=25,
                    linewidth=2,
                    size_percent=45
                    ),
                widget.TextBox(
                    background=colors[0],
                    font='DroidSansMono Nerd Font',
                    fontsize=20,
                    foreground=colors[1],
                    padding=0,
                    text=' '
                ),
                widget.CPU(
                    background=colors[0],
                    font='DroidSansMono Nerd Font',
                    fontsize=15,
                    foreground=colors[1],
                    format='CPU {load_percent}%',
                    update_interval=1
                ),
            ],
            28,
            margin=[0, 0, 3, 0],
            opacity=1
        ),
    ),
]
