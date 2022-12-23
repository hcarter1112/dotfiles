#!/bin/bash
## RUN AS SUDO
# make installs and wrap up in sudo

## Make install rofi-emoji
cd /home/ralldi/.gitstuff/rofi-emoji/build/ &&
  make install &&

## Make install rofi-calc
cd /home/ralldi/.gitstuff/rofi-calc/build &&
 make install && 

## Install i3-lock-color
  ./home/ralldi/.gitstuff/i3lock-color/install-i3lock-color.sh &&

## Placing files for betterlockscreen
  cp /home/ralldi/.gitstuff/betterlockscreen-main/betterlockscreen /usr/local/bin/ &&
    cp /home/ralldi/.gitstuff/betterlockscreen-main/system/betterlockscreen@.service /usr/lib/systemd/system/ &&
    systemctl enable betterlockscreen@$USER &&

## make install gsimplecal
  cd /home/ralldi/.gitstuff/gsimplecal/ &&
    make install &&

## Move files for tty-clock
  mv tty-clock /usr/local/bin/tty-clock
