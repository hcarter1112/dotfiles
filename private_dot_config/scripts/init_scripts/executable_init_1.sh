#!/bin/bash
#
#This file is to be used with an installation of any distro with the aim of getting me up and 
#running faster.
#
#STEP 0 - THE PREP - establishing variables and such

### - Establish disroname 
# if [ -n "$(command -v lsb_release)" ]; then
# 	distroname=$(lsb_release -s -d)
# elif [ -f "/etc/os-release" ]; then
# 	distroname=$(grep PRETTY_NAME /etc/os-release | sed 's/PRETTY_NAME=//g' | tr -d '="')
# elif [ -f "/etc/debian_version" ]; then
# 	distroname="Debian $(cat /etc/debian_version)"
# elif [ -f "/etc/redhat-release" ]; then
# 	distroname=$(cat /etc/redhat-release)
# else
# 	distroname="$(uname -s) $(uname -r)"
# fi
# 
# # This line writes the first word of $distroname to a txt file to reference when establishing the 
# # install command depending on the distro
# 
# distroname=$( echo "${distroname}" | tr -s '[:upper:]'  '[:lower:]' )
# 
# echo ${distroname} | sed -e 's/\s.*$//' > /home/$USER/distro.txt
# 
# # This line is establishing the install variable for shorthand later. 
# ### If the error line called you here copy the following 2 lines, put them under an elif
# #statement and replace the word"Fedora" with the name of your distro.
# 
# if [[ $(grep -i Fedora ~/distro.txt) = "Fedora" ]]; then
#   install() {
#       sudo -s <<EOF
#       dnf install "$@"
#       EOF
#     }
# else
#   echo "Please insert another elif statement in the variables section under
#   the distro selection section of your init file before you continue"
#   exit 1
# fi

###### STEP 1 - INSTALL DNF PROGRAMS
if [[ ! -d /home/ralldi/Downloads ]]; then
 mkdir /home/ralldi/Downloads/ 
fi

if [[ ! -d /home/ralldi/Documents ]]; then
 mkdir /home/ralldi/Documents/ 
fi

if [[ ! -d /home/ralldi/Desktop/ ]]; then
 mkdir /home/ralldi/Desktop/ 
fi

if [[ ! -d /home/ralldi/Pictures/ ]]; then
 mkdir /home/ralldi/Pictures/ 
fi

if [[ ! -d /home/ralldi/Videos/ ]]; then
 mkdir /home/ralldi/Videos/ 
fi

dnf install -y \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm \
gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel \
lame\* --exclude=lame-devel \
autoconf \
automake \
bat  \
cairo-devel \
copyq \
curl  \
dbus-devel \
dunst \
exa  \
fd-find \
feh  \
fish \
flameshot \
flatpak \
fontconfig \
gcc  \
git  \
git-cola \
google-noto-emoji-color-fonts \
gtk3-devel \
htop \
ImageMagick \
kitty \
kmod-v4l2loopback \
libxcb-devel \
libXinerama  \
libxkbcommon-devel  \
libxkbcommon-x11-devel  \
libXrandr \
libjpeg-turbo-devel \
libev-devel \
libtool \
lxappearance  \
lxpolkit  \
ncurses-devel \
neovim \
network-manager-applet \
nitrogen \
openssl-devel \
pam-devel  \
pcmanfm \
picom  \
pkgconf \
pulseaudio-libs-devel \
python3-pip \
qalc \
ranger \
rclone \
rofi \
rofi-devel \
vim  \
volumeicon \
wget  \
xclip \
xdotool \
xdpyinfo \
xcb-util-image-devel  \
xcb-util-xrm-devel \
setxkbmap \
xorg-x11-server-Xorg \
xrandr \
xrdb \
xset \
xsel \
xss-lock \
v4l2loopback \
vlc \
&&

dnf group upgrade --with-optional Multimedia -y &&

hostnamectl set-hostname "main-pc" &&

chsh -s /usr/bin/fish &&
chsh -s /usr/bin/fish ralldi &&

## move systemd files and enable
##
## v4l2loopback service
cp /home/ralldi/Downloads/v4l2.service /etc/X11/systemd/system/ &&
  systemctl enable v4l2.service &&

## pulsemods service
cp /home/ralldi/Downloads/pulsemods.service /etc/systemd/user/ &&
  
## Qtile desktop file
cp /home/ralldi/Downloads/qtile.desktop /usr/share/xsessions/ &&

## Backgrounds folder
cp -r /home/ralldi/Downloads/backgrounds/* /usr/share/backgrounds/

