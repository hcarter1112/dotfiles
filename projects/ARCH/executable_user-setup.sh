#!/bin/bash
## This script will set up the base root system, prompt for a host name, and set up users and passwords

cd /ARCH &&

	## General system setup
	ln -sf /usr/share/zoneinfo/America/Lima /etc/localtime &&
	cp locale.gen /etc/ &&
	locale-gen &&
	hwclock -w &&
	echo "LANG=en_US.UTF-8" >/etc/locale.conf &&

	## Move essetial system files into place
	cd / &&
	cp /ARCH/sudoers /etc/ &&
	cp /ARCH/mkinitcpio.conf /etc/ &&
	cp /ARCH/grub /etc/default/ &&
	cp /ARCH/v4l2.service /etc/systemd/system/ &&

	## Create fallback for pacman.conf and then copy the file
	if [ -f /etc/pacman.conf ]; then
		mv /etc/pacman.conf /etc/pacman.conf.bak
	fi
cp /ARCH/pacman.conf /etc/pacman.conf &&

	## mkinitcpio and install grub to the system
	mkinitcpio -P &&
	grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=ARX &&
	grub-mkconfig -o /boot/grub/grub.cfg
