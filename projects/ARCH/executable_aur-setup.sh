#!/bin/bash

#Pikaur install
cd /home/ralldi/.gitstuff/ &&
	if [[ ! -d ~/.gitstuff/pikaur-git/ ]]; then
		git clone https://aur.archlinux.org/pikaur-git.git
	fi
cd /home/ralldi/.gitstuff/pikaur-git/ &&
	makepkg -si &&

	#Paru install
	cd /home/ralldi/.gitstuff/ &&
	if [[ ! -d ~/.gitstuff/paru-git/ ]]; then
		git clone https://aur.archlinux.org/paru-git.git
	fi
cd /home/ralldi/.gitstuff/paru-git/ &&
	makepkg -si &&

	#yay install
	cd /home/ralldi/.gitstuff/ &&
	if [[ ! -d ~/.gitstuff/yay-git/ ]]; then
		git clone https://aur.archlinux.org/yay-git.git
	fi
cd /home/ralldi/.gitstuff/yay-git/ &&
	makepkg -si
