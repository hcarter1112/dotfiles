from libqtile import hook

import os
import re
import socket
import shutil
import subprocess

home = os.path.expanduser('~')
prompt = "{0}@{1}: ".format(os.environ["USER"], socket.gethostname())

@hook.subscribe.restart
def cleanup():
    shutil.rmtree([home + '/.config/qtile/__pycache__'])

@hook.subscribe.shutdown
def killall():
    shutil.rmtree([home + '/.config/qtile/__pycache__'])
    subprocess.Popen(['killall', 'urxvtd', 'lxpolkit', 'nitrogen', 'picom'])

@hook.subscribe.startup
def startup():
    top.show(False)

@hook.subscribe.startup_once
def start_once():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])

@hook.subscribe.startup
def start_always():
    # Set the cursor to something sane in X
    subprocess.Popen(['xsetroot', '-cursor_name', 'left_ptr'])

@hook.subscribe.client_new
def set_floating(window):
    if (window.window.get_wm_transient_for()
            or window.window.get_wm_type() in floating_types):
        window.floating = True

floating_types = ["notification", "toolbar", "splash", "dialog"]

@hook.subscribe.screens_reconfigured
async def _():
    if len(qtile.screens) > 1:
        groupbox1.visible_groups = ['1', '2', '3', '4', '5', '6']
    else:
        groupbox1.visible_groups = ['1', '2', '3', '4', '5', '6', '7', '8', '9']
    if hasattr(groupbox1, 'bar'):
        groupbox1.bar.draw()
