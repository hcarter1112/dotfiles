#!/bin/bash
#### This part of the script should run without root...
#
if [[ ! -d /home/ralldi/.config/ ]]
then
  mkdir /home/ralldi/.config/ 
fi

if [[ ! -d /home/ralldi/Pictures/ ]]
then
  mkdir /home/ralldi/Pictures/ 
fi

if [[ ! -d /home/ralldi/Videos/ ]]
then
  mkdir /home/ralldi/Videos/ 
fi

if [[ ! -d /home/ralldi/Downloads/ ]]
then
  mkdir /home/ralldi/Downloads/ 
fi

if [[ ! -d /home/ralldi/Documents/ ]]
then
  mkdir /home/ralldi/Documents/ 
fi

## Install flatpak repo
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo &&

## Make a git clone folder and go to it
if [[ ! -d /home/ralldi/.gitstuff ]]; then
mkdir /home/ralldi/.gitstuff
fi
cd /home/ralldi/.gitstuff/ &&

## git clone rofi-emoji
if [ ! -d /home/ralldi/.gitstuff/rofi-emoji/ ]
then
  cd /home/ralldi/.gitstuff/ &&
  git clone https://github.com/Mange/rofi-emoji.git
fi
  cd /home/ralldi/.gitstuff/rofi-emoji/ &&
  autoreconf -i &&
  mkdir /home/ralldi/.gitstuff/rofi-emoji/build &&
  cd /home/ralldi/.gitstuff/rofi-emoji/build &&
  /home/ralldi/.gitstuff/rofi-emoji/configure &&
  make &&
## git clone rofi-calc
if [ ! -d /home/ralldi/.gitstuff/rofi-calc/ ]
then
  cd /home/ralldi/.gitstuff/ &&
  git clone https://github.com/svenstaro/rofi-calc.git
fi
  cd /home/ralldi/.gitstuff/rofi-calc/ &&
  autoreconf -i &&
  mkdir /home/ralldi/.gitstuff/rofi-calc/build/ &&
  cd /home/ralldi/.gitstuff/rofi-calc/build &&
  /home/ralldi/.gitstuff/rofi-calc/configure &&
  make &&

## git clone i3-lock-color
if [ ! -d /home/ralldi/.gitstuff/i3lock-color/ ]
then
  cd /home/ralldi/.gitstuff/ &&
  git clone https://github.com/Raymo111/i3lock-color.git
fi

## wget betterlockscreen and make betterlockscreen
if [ ! -d /home/ralldi/.gitstuff/betterlockscreen-main/ ]
then
  cd /home/ralldi/.gitstuff/ &&
  wget https://github.com/betterlockscreen/betterlockscreen/archive/refs/heads/main.zip &&
    unzip main.zip &&
    cd /home/ralldi/.gitstuff/betterlockscreen-main/ &&
    chmod u+x betterlockscreen
fi

## Build ncspot
if [ ! -d /home/ralldi/.gitstuff/ncspot/ ]
then
  cd /home/ralldi/.gitstuff/ &&
  git clone https://github.com/hrkfdn/ncspot
fi
  cd /home/ralldi/.gitstuff/ncspot &&
    cargo install --path /home/ralldi/.gitstuff/ncspot &&

## Gsimplecal
if [ ! -d /home/ralldi/.gitstuff/gsimplecal/ ]
then
  cd /home/ralldi/.gitstuff/ &&
  git clone https://github.com/dmedvinsky/gsimplecal.git
fi
  cd /home/ralldi/.gitstuff/gsimplecal/ &&
    /home/ralldi/.gitstuff/gsimplecal/autogen.sh &&
    /home/ralldi/.gitstuff/gsimplecal/configure &&
    make &&

## tty-clock
if [ ! -d /home/ralldi/.gitstuff/tty-clock/ ]
then
  cd /home/ralldi/.gitstuff/  &&
  git clone https://github.com/xorg62/tty-clock
fi
    cd /home/ralldi/.gitstuff/tty-clock/ &&
    make &&
    chmod +x tty-clock &&

## Dragon (Drag and drop)
if [ ! -d /home/ralldi/.gitstuff/dragon/ ]
then
  cd /home/ralldi/.gitstuff/ &&
  git clone https://github.com/mwh/dragon
fi
  cd /home/ralldi/.gitstuff/dragon/ &&
    make &&
    make install &&

## Lazyvim install
./lazyvim-install.sh &&

./chezmoi.sh &&
## Start user services
systemctl --user enable pulsemods.service &&

## Pip installs
pip install qtile pulsemixer &&

## Flatpak installs
flatpak install us.zoom.Zoom org.libreoffice.LibreOffice org.ferdium.Ferdium md.obsidian.Obsidian com.obsproject.Studio com.github.tchx84.Flatseal com.brave.Browser
