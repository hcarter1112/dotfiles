#!/usr/bin/bash

if [[ -f /etc/pacman.d/mirrorlist ]]
then
  mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak &&
  reflector --save /etc/pacman.d/mirrorlist -a 24 -f 50 -l 25 --score 25 -n 12
fi
