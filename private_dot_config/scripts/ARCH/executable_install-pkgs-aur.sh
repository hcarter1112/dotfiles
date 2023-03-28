#!/bin/bash
#
chsh -s /usr/bin/fish &&
	rustup default stable &&
	pikaur -S \
		betterlockscreen \
		zoom \
		tty-clock-git \
		ferdium \
		i3lock-color \
		gruvbox-dark-gtk \
		gruvbox-dark-icons-gtk \
		gruvbox-material-gtk-theme-git \
		gruvbox-material-icon-theme-git \
		gtk-theme-arc-gruvbox-git \
		ncspot-git \
		xcursor-comix-opaque \
		xpadneo-dkms-git \
		input-remapper-git \
		zhumu \
		dragon-drop-git &&
	yay -S librewolf-bin &&
	if [ $printing -eq 1 ]; then
		echo "#######################################################"
		echo "               Installing Cups and SANE                "
		echo "#######################################################"
		pikaur -S sane \
			sane-airscan \
			system-config-printer \
			epson-inkjet-printer-escpr \
			epson-inkjet-printer-escpr2 \
			iscan-plugin-networkcups \
			cups-pdf \
			cups-filters \
			gutenprint \
			simple-scan \
			foomatic-db-gutenprint-ppds &&
			echo "#######################################################"
		echo "              Printer and scanner stuff installed      "
		echo "#######################################################"
	elif [ $printing -eq 2 ]; then
		echo "#######################################################"
		echo "            NOT INSTALLING PRINTER SCANNER STUFF            "
		echo "#######################################################"
	else
		echo "Please enter a valid number"
	fi
