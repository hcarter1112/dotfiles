#!/bin/sh

run() {
  if ! pgrep -f "$1" ;
  then
    "$@"&
  fi
}

run xrandr --output DP-4 --mode 2560x1440 --rate 120 --pos 0x0 --rotate right --output DP-2 --mode 2560x1440 --rate 120 --pos 1440x560
run setxkbmap -option "caps:escape_shifted_capslock"
run xset s 3600
run xss-lock /home/ralldi/.config/scripts/betterlock.sh
run dunst
run nitrogen --restore
run picom -b
run lxpolkit
run copyq --start-server
#run nm-applet
#run volumeicon
#run urxvtd -q -o -f
#run emacs --daemon
