#!/bin/bash

pacstrap /mnt base base-devel linux linux-lts linux-headers linux-lts-headers man-db vim networkmanager connman sudo btrfs-progs grub efibootmgr intel-ucode &&
genfstab -U /mnt > /mnt/etc/fstab &&
cp -r . /mnt/ &&
arch-chroot /mnt 

