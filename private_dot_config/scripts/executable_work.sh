#!/usr/bin/env sh

flatpak run com.obsproject.Studio --startvirtualcam &
sleep 3 &&
flatpak run md.obsidian.Obsidian &
sleep 3 &&
flatpak run us.zoom.Zoom &
sleep 3 &&
/usr/bin/zhumuintl &
sleep 3 &&
flatpak run org.rncbc.qpwgraph &
sleep 3 &&
/usr/bin/pcmanfm "/home/ralldi/Downloads/class-notes/"
