#!/bin/bash
#
echo "Please enter your hostname: "
read hostname &&
hostnamectl set-hostname "$hostname" &&

chsh -s /usr/bin/fish &&
chsh -s /usr/bin/fish ralldi &&

## move systemd files and enable
##
## v4l2loopback service and enableing systemd services
cp v4l2.service /etc/systemd/system/ &&

## pulsemods service
cp pulsemods.service /etc/systemd/user/ &&
  
## Qtile desktop file
cp qtile.desktop /usr/share/xsessions/ &&

## Backgrounds folder
cd /usr/share/ &&
git clone https://github.com/hcarter1112/Backgrounds.git &&

cp lightdm.conf /etc/lightdm/lightdm.conf &&

if [[ -f /etc/default/grub ]]
then
  mv /etc/default/grub /etc/default/grub.bak &&
  cp grub /etc/default/
fi

./chezmoi-install.sh &&

systemctl enable --now chronyd libvirtd lightdm NetworkManager polkit v4l2 &&
 
usermod -aG libvirt ralldi
