#!/bin/bash
#### This part of the script should run without root...
#
## Install flatpak repo
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo &&

## Install Node Version Manager (nvm)
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash &&
  nvm install node &&

## Install rust and cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh &&

## Install Lunar Vim
LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh) &&

## Make a git clone folder and go to it
mkdir /home/ralldi/.gitstuff &&
cd /home/ralldi/.gitstuff/ &&

## git clone rofi-emoji
  cd /home/ralldi/.gitstuff/ &&
git clone https://github.com/Mange/rofi-emoji.git &&
  cd /home/ralldi/.gitstuff/rofi-emoji/ &&
  autoreconf -i &&
  mkdir /home/ralldi/.gitstuff/build &&
  cd /home/ralldi/.gitstuff/build/ &&
  ../configure &&
  make &&

## git clone rofi-calc
  cd /home/ralldi/.gitstuff/ &&
git clone https://github.com/svenstaro/rofi-calc.git &&
  cd /home/ralldi/.gitstuff/rofi-calc/ &&
  autoreconf -i &&
  mkdir /home/ralldi/.gitstuff/rofi-calc/build/ &&
  cd /home/ralldi/.gitstuff/rofi-calc/build/ &&
  ../configure &&
  make &&

## git clone i3-lock-color
  cd /home/ralldi/.gitstuff/ &&
  git clone https://github.com/Raymo111/i3lock-color.git &&
    /home/ralldi/.gitstuff/i3lock-color/build.sh &&

## wget betterlockscreen and make betterlockscreen
  cd /home/ralldi/.gitstuff/ &&
  wget https://github.com/betterlockscreen/betterlockscreen/archive/refs/heads/main.zip &&
    unzip main.zip &&
    cd /home/ralldi/.gitstuff/betterlockscreen-main/ &&
    chmod u+x betterlockscreen &&

## Build ncspot
  cd /home/ralldi/.gitstuff/ &&
  git clone https://github.com/hrkfdn/ncspot &&
    cargo build --release &&

## Gsimplecal
  cd /home/ralldi/.gitstuff/ &&
  git clone git://github.com/dmedvinsky/gsimplecal.git &&
    /home/ralldi/.gitstuff/gsimplecal/autogen.sh &&
    /home/ralldi/.gitstuff/gsimplecal/configure &&
    make &&

## tty-clock
  cd /home/ralldi/.gitstuff/  &&
  git clone https://github.com/xorg62/tty-clock &&
    cd /home/ralldi/.gitstuff/tty-clock/ &&
    make &&
    chmod +x tty-clock &&

## Pip installs
  pip install xcffib cairocffi qtile

## Flatpak installs
flatpak install us.zoom.Zoom org.rncbc.qpwgraph org.rncbc.qpwgraph org.libreoffice.LibreOffice org.ferdium.Ferdium net.lutris.Lutris md.obsidian.Obsidian com.obsproject.Studio com.github.tchx84.Flatseal com.brave.Browser

