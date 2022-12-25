#!/bin/bash
#### This part of the script should run without root...
#

## Install flatpak repo
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo &&

## Make a git clone folder and go to it
if [[ ! -d /home/ralldi/.gitstuff ]]; then
mkdir /home/ralldi/.gitstuff
fi
cd /home/ralldi/.gitstuff/ &&

## git clone rofi-emoji
  cd /home/ralldi/.gitstuff/ &&
git clone https://github.com/Mange/rofi-emoji.git &&
  cd /home/ralldi/.gitstuff/rofi-emoji/ &&
  autoreconf -i &&
  mkdir /home/ralldi/.gitstuff/rofi-emoji/build &&
  cd /home/ralldi/.gitstuff/rofi-emoji/build &&
  /home/ralldi/.gitstuff/rofi-emoji/configure &&
  make &&

## git clone rofi-calc
  cd /home/ralldi/.gitstuff/ &&
git clone https://github.com/svenstaro/rofi-calc.git &&
  cd /home/ralldi/.gitstuff/rofi-calc/ &&
  autoreconf -i &&
  mkdir /home/ralldi/.gitstuff/rofi-calc/build/ &&
  cd /home/ralldi/.gitstuff/rofi-calc/build &&
  /home/ralldi/.gitstuff/rofi-calc/configure &&
  make &&

## git clone i3-lock-color
  cd /home/ralldi/.gitstuff/ &&
  git clone https://github.com/Raymo111/i3lock-color.git &&

## wget betterlockscreen and make betterlockscreen
  cd /home/ralldi/.gitstuff/ &&
  wget https://github.com/betterlockscreen/betterlockscreen/archive/refs/heads/main.zip &&
    unzip main.zip &&
    cd /home/ralldi/.gitstuff/betterlockscreen-main/ &&
    chmod u+x betterlockscreen &&

## Build ncspot
  cd /home/ralldi/.gitstuff/ &&
  git clone https://github.com/hrkfdn/ncspot &&
  cd /home/ralldi/.gitstuff/ncspot &&
    cargo install --path /home/ralldi/.gitstuff/ncspot &&

## Gsimplecal
  cd /home/ralldi/.gitstuff/ &&
  git clone https://github.com/dmedvinsky/gsimplecal.git &&
  cd /home/ralldi/.gitstuff/gsimplecal/ &&
    /home/ralldi/.gitstuff/gsimplecal/autogen.sh &&
    /home/ralldi/.gitstuff/gsimplecal/configure &&
    make &&

## tty-clock
  cd /home/ralldi/.gitstuff/  &&
  git clone https://github.com/xorg62/tty-clock &&
    cd /home/ralldi/.gitstuff/tty-clock/ &&
    make &&
    chmod +x tty-clock &&

## Start user services
systemctl --user enable pulsemods.service &&

## Pip installs
  pip install xcffib cairocffi qtile psutil &&

## Flatpak installs
flatpak install us.zoom.Zoom org.rncbc.qpwgraph org.rncbc.qpwgraph org.libreoffice.LibreOffice org.ferdium.Ferdium net.lutris.Lutris md.obsidian.Obsidian com.obsproject.Studio com.github.tchx84.Flatseal com.brave.Browser

