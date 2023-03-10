from libqtile import bar
from .widgets import *
from libqtile.config import Screen

import os

widget_defaults = dict(
    font='DroidSansMono Nerd Font',
    fontsize=15,
    padding=3,
    background=colors[2],
    foreground=colors[5]
)

extension_defaults = widget_defaults.copy()

screens = [
######## Primary Screen
    Screen(
        top=bar.Bar(
            [
                widget.TextBox(
                    background=colors[7],
                    font='DroidSansMono Nerd Font',
                    fontsize=25,
                    foreground=colors[2],
                    padding=5,
                    text=''
                ),
                widget.TextBox(
                    background=colors[2],
                    font='DroidSansMono Nerd Font',
                    fontsize=30,
                    foreground=colors[7],
                    padding=0,
                    text=''
                ),
                widget.GroupBox(
                    visible_groups=['1', '2', '3', '4', '5', '6'],
                    active=colors[22], #b48ead
                    borderwidth=2,
                    disable_drag=True,
                    font='DroidSansMono Nerd Font',
                    fontsize=20,
                    hide_unused=False,
                    highlight_method='line',
                    inactive=colors[9],
                    margin_x=0,
                    margin_y=3,
                    padding_x=5,
                    padding_y=8,
                    rounded=False,
                    this_current_screen_border=colors[13],
                    urgent_alert_method='line'
                ),
                widget.TextBox(
                    background=colors[7],
                    font='DroidSansMono Nerd Font',
                    fontsize=30,
                    foreground=colors[2],
                    padding=0,
                    text=''
                ),
                widget.CurrentLayoutIcon(
                    background=colors[7],
                    custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
                    foreground=colors[2], #e5e9f0
                    padding=0,
                    scale=0.65
                ),
                widget.TextBox(
                    background=colors[2],
                    font='DroidSansMono Nerd Font',
                    fontsize=30,
                    foreground=colors[7],
                    padding=0,
                    text=''
                ),
                widget.WindowName(
                    background=colors[2],
                    foreground=colors[3],
                    font='DroidSansMono Nerd Font',
                    fontsize = 16,
                    max_chars=30
                ),
                widget.Spacer(),
                widget.TextBox(
                    background=colors[2],
                    font='DroidSansMono Nerd Font',
                    fontsize=20,
                    foreground=colors[12],
                    padding=0,
                    text=' '
                ),
                widget.Clock(
                    background=colors[2],
                    font='DroidSansMono Nerd Font Bold',
                    fontsize=22,
                    foreground=colors[12],
                    format='%a %Y-%m-%d || %I:%M:%S %p ',
                    mouse_callbacks={'Button1': lambda : qtile.cmd_spawn('gsimplecal')}
                ),
                widget.Spacer(),
                widget.TextBox(
                    background=colors[2],
                    font='DroidSansMono Nerd Font',
                    fontsize=30,
                    foreground=colors[7],
                    padding=0,
                    text=''
                ),
                widget.Systray(
                    background=colors[7],
                    icon_size=20,
                    padding=4
                ),
                widget.TextBox(
                    background=colors[7],
                    font='DroidSansMono Nerd Font',
                    fontsize=30,
                    foreground=colors[22],
                    padding=0,
                    text=''
                ),
                widget.TextBox(
                    background=colors[22],
                    font='DroidSansMono Nerd Font',
                    fontsize=20,
                    foreground=colors[6],
                    padding=0,
                    text=' '
                ),
                widget.ThermalSensor(
                    background=colors[22],
                    font='DroidSansMono Nerd Font',
                    fontsize=15,
                    foreground=colors[6],
                    update_interval=2
                ),
                widget.TextBox(
                    background=colors[22],
                    font='DroidSansMono Nerd Font',
                    fontsize=30,
                    foreground=colors[7],
                    padding=0,
                    text=''
                ),
                widget.TextBox(
                    background=colors[7],
                    font='DroidSansMono Nerd Font',
                    fontsize=20,
                    foreground=colors[14],
                    padding=0,
                    text=' '
                ),
                widget.Memory(
                    background=colors[7],
                    font='DroidSansMono Nerd Font',
                    fontsize=15,
                    foreground=colors[14],
                    format="{MemUsed: .0f}{mm}",
                    update_interval=1.0
                ),
                widget.TextBox(
                    background=colors[7],
                    font='DroidSansMono Nerd Font',
                    fontsize=30,
                    foreground=colors[14],
                    padding=0,
                    text=''
                ),
                widget.TextBox(
                    background=colors[14],
                    font='DroidSansMono Nerd Font',
                    fontsize=20,
                    foreground=colors[7],
                    padding=0,
                    text=' '
                ),
                widget.CPU(
                    background=colors[14],
                    font='DroidSansMono Nerd Font',
                    fontsize=15,
                    foreground=colors[7],
                    format='CPU {load_percent}%',
                    update_interval=1
                ),
                widget.TextBox(
                    background=colors[14],
                    font='DroidSansMono Nerd Font',
                    fontsize=30,
                    foreground=colors[7],
                    padding=0,
                    text=''
                ),
                widget.TextBox(
                    background=colors[7],
                    font='DroidSansMono Nerd Font',
                    fontsize=30,
                    foreground=colors[17],
                    padding=0,
                    text=' ﮮ'
                ),
                widget.CheckUpdates(
                    background=colors[7],
                    font='DroidSansMono Nerd Font',
                    fontsize=15,
                    foreground=colors[17],
                    colour_no_updates=colors[20],
                    colour_have_updates=colors[17],
                    no_update_string='None',
                    display_format='{updates}',
                    distro='Fedora',
                    initial_text='...',
                    update_interval=600
                ),
                widget.TextBox(
                    background=colors[7],
                    font='DroidSansMono Nerd Font',
                    fontsize=30,
                    foreground=colors[17],
                    padding=0,
                    text=''
                ),
                widget.TextBox(
                    background=colors[17],
                    font='DroidSansMono Nerd Font',
                    fontsize=20,
                    foreground=colors[7],
                    padding=0,
                    text=' '
                ),
                widget.KeyboardLayout(
                    background=colors[17],
                    font='DroidSansMono Nerd Font',
                    fontsize=15,
                    foreground=colors[7]
                ),
                widget.CapsNumLockIndicator(
                    background=colors[17],
                    font='DroidSansMono Nerd Font',
                    fontsize=15,
                    foreground=colors[7]
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
                    active=colors[22], #b48ead
                    borderwidth=2,
                    disable_drag=True,
                    font='DroidSansMono Nerd Font',
                    fontsize=25,
                    hide_unused=False,
                    highlight_method='line',
                    inactive=colors[9],
                    margin_x=0,
                    margin_y=3,
                    padding_x=5,
                    padding_y=8,
                    rounded=False,
                    this_current_screen_border=colors[13],
                    urgent_alert_method='line'
                ),
                widget.TextBox(
                    background=colors[7],
                    font='DroidSansMono Nerd Font',
                    fontsize=30,
                    foreground=colors[2],
                    padding=0,
                    text=''
                ),
                widget.CurrentLayoutIcon(
                    background=colors[7],
                    custom_icon_paths=[os.path.expanduser("~/.config/qtile/icons")],
                    foreground=colors[2], #e5e9f0
                    padding=0,
                    scale=0.65
                ),
                widget.TextBox(
                    background=colors[2],
                    font='DroidSansMono Nerd Font',
                    fontsize=30,
                    foreground=colors[7],
                    padding=0,
                    text=''
                ),
                widget.WindowName(
                    background=colors[2],
                    foreground=colors[3],
                    font='DroidSansMono Nerd Font',
                    fontsize = 16,
                    max_chars=10
                ),
                widget.Spacer(),
                widget.TextBox(
                    background=colors[2],
                    font='DroidSansMono Nerd Font',
                    fontsize=20,
                    foreground=colors[12],
                    padding=0,
                    text=' '
                ),
                widget.Clock(
                    background=colors[2],
                    font='DroidSansMono Nerd Font Bold',
                    fontsize=22,
                    foreground=colors[12],
                    format='%a %Y-%m-%d || %I:%M:%S %p ',
                    mouse_callbacks={'Button1': lambda : qtile.cmd_spawn('gsimplecal')}
                ),
                widget.Spacer(),
                widget.TextBox(
                    background=colors[2],
                    font='DroidSansMono Nerd Font',
                    fontsize=30,
                    foreground=colors[22],
                    padding=0,
                    text=''
                ),
                widget.TextBox(
                    background=colors[22],
                    font='DroidSansMono Nerd Font',
                    fontsize=20,
                    foreground=colors[6],
                    padding=0,
                    text=' '
                ),
                widget.ThermalSensor(
                    background=colors[22],
                    font='DroidSansMono Nerd Font',
                    fontsize=15,
                    foreground=colors[6],
                    update_interval=2
                ),
                widget.TextBox(
                    background=colors[22],
                    font='DroidSansMono Nerd Font',
                    fontsize=30,
                    foreground=colors[7],
                    padding=0,
                    text=''
                ),
                widget.TextBox(
                    background=colors[7],
                    font='DroidSansMono Nerd Font',
                    fontsize=20,
                    foreground=colors[14],
                    padding=0,
                    text=' '
                ),
                widget.Memory(
                    background=colors[7],
                    font='DroidSansMono Nerd Font',
                    fontsize=15,
                    foreground=colors[14],
                    format="{MemUsed: .0f}{mm}",
                    update_interval=1.0
                ),
                widget.TextBox(
                    background=colors[7],
                    font='DroidSansMono Nerd Font',
                    fontsize=30,
                    foreground=colors[14],
                    padding=0,
                    text=''
                ),
                widget.TextBox(
                    background=colors[14],
                    font='DroidSansMono Nerd Font',
                    fontsize=20,
                    foreground=colors[7],
                    padding=0,
                    text=' '
                ),
                widget.CPU(
                    background=colors[14],
                    font='DroidSansMono Nerd Font',
                    fontsize=15,
                    foreground=colors[7],
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
