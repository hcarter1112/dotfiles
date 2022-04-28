#!/bin/bash

### Autostart Script for Awesome ###

## Compositor
picom &

## Wallpaper Set
feh --bg-max --no-fehbg --randomize /home/ralldi/Pictures/Backgrounds/*

## Clipboard manger
copyq

## Network Manager Icon
sleep 5; nm-applet &

## Volume Icon
sleep 30; volumeicon &
