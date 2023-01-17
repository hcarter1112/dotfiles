#!/usr/bin/sh
# run() {
#   if ! pgrep -f "$1" ;
#   then
#     "$@"&
#   fi
# }

kitty --class kitty1 &
kitty --class pulse pulsemixer &
kitty --class ncspot ncspot &
kitty --class ranger ranger &
