#!/bin/bash

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
genfstab -U /mnt > /mnt/etc/fstab &&
cp -r /root/ARCH/ /mnt/ &&
arch-chroot /mnt &&
cd ARCH

