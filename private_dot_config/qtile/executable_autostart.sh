#!/usr/bin/sh

run() {
	if ! pgrep -f "$1"; then
		"$@" &
	fi
}

run xrandr --output DisplayPort-1 --mode 2560x1440 --rate 165 --pos 0x0 --rotate right --output DisplayPort-0 --mode 2560x1440 --rate 165 --pos 1440x560
run xset s 3600
run xss-lock /home/ralldi/.config/scripts/betterlock.sh
run dunst
run picom -b
run lxpolkit
run copyq --start-server
run nm-applet
run nitrogen --restore
# run volumeicon
#run urxvtd -q -o -f
# run /usr/bin/emacs-lucid --daemon
# run /usr/bin/emacs-lucid --with-profile legacy --daemon
# run /usr/bin/offlineimap
run /usr/bin/sxhkd
run /usr/bin/corectrl
