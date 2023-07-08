#!/bin/bash
## This script will install the base system along with essential tools, and GRUB tools
## This will also generate the fs-table and copy the ARCH scripts directory into the host
## The script finishes by chrooting into the host

pacstrap /mnt \
	base \
	base-devel \
	linux \
	linux-lts \
	linux-headers \
	linux-lts-headers \
	man-db \
	vim \
	networkmanager \
	connman \
	sudo \
	btrfs-progs \
	grub \
	efibootmgr &&
	genfstab -U /mnt >/mnt/etc/fstab &&
	cp -r /root/ARCH/ /mnt/ &&
	arch-chroot /mnt
