#!/usr/bin/env sh

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar

# Launch bar1 and bar2
echo "---" | tee -a /tmp/polybar1.log /tmp/polybar2.log
polybar -r --config=/home/ralldi/.config/polybar/i3/config-i3.ini bar1 2>&1 | tee -a /tmp/polybar1.log & disown
polybar -r --config=/home/ralldi/.config/polybar/i3/config-i3.ini bar2 2>&1 | tee -a /tmp/polybar2.log & disown

echo "Bars launched..."
