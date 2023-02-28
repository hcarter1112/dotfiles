#!/bin/bash

cd ~/.gitstuff/ &&
if [[ ! -d ~/.gitstuff/yay-git/ ]]
then
  git clone https://aur.archlinux.org/yay-git.git
fi
cd ~/.gitstuff/yay-git/ &&
makepkg -si
