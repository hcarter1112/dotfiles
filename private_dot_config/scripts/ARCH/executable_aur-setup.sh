#!/bin/bash

cd ~/.gitstuff/ &&
git clone https://aur.archlinux.org/yay-git.git &&
cd ~/.gitstuff/yay-git/ &&
makepkg -si
