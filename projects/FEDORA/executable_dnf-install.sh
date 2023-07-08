#!/bin/bash
dnf install -y \
https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm &&
dnf install -y \
gstreamer1-plugins-{bad-\*,good-\*,base} gstreamer1-plugin-openh264 gstreamer1-libav --exclude=gstreamer1-plugins-bad-free-devel \
lame\* --exclude=lame-devel \
akmod-v4l2loopback \
autoconf \
automake \
bat  \
cairo-devel \
cargo \
chrony \
copyq \
corectrl \
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
google-noto-emoji-color-fonts \
gtk3-devel \
htop \
i3 \
ImageMagick \
kitty \
kmod-v4l2loopback \
lazygit \
libxcb-devel \
libXinerama  \
libxkbcommon-devel  \
libxkbcommon-x11-devel  \
libXrandr \
libjpeg-turbo-devel \
libev-devel \
libtool \
lightdm \
lightdm-gtk \
lxappearance  \
lxpolkit  \
ncurses-devel \
neovim \
network-manager-applet \
nitrogen \
openssl-devel \
pam-devel  \
picom  \
pipewire \
pipewire-alsa \
pipewire-pulseaudio \
pipewire-utils \
pkgconf \
polybar \
pulseaudio-libs-devel \
python3-devel \
python3-pip \
python3-cffi \
python3-xcffib \
python3-cairocffi \
python3-dbus-next \
qalc \
qpwgraph \
ranger \
ripgrep \
rclone \
rofi \
rofi-devel \
sxhkd \
util-linux-user \
vim  \
v4l2loopback \
volumeicon \
wget  \
wireplumber \
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

dnf copr enable pennbauman/ports &&
dnf install lf &&
dnf config-manager --add-repo https://rpm.librewolf.net/librewolf-repo.repo &&
dnf install librewolf &&
dnf group upgrade --with-optional Multimedia -y &&
dnf group install --with-optional virtualization -y 

