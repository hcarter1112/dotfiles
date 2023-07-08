#!/bin/bash
## Installation section
echo "#######################################################"
echo "               Installing cpu and gpu drivers             "
echo "#######################################################"
if [ $cpu -eq 1 ]; then
	echo "You have selected AMD..."
	echo "Installing AMD cpu drivers..." &&
		pacman -S amd-ucode
elif [ $cpu -eq 2 ]; then
	echo "You have selected Intel..."
	echo "Installing Intel cpu ucode..." &&
		pacman -S intel-ucode
else
	echo "Please enter a valid option"
fi

if [ $gpu -eq 0 ]; then
	echo "You have selected NO GPU..."
	echo "no graphics dirvers to install... skipping..."
elif [ $gpu -eq 1 ]; then
	echo "You have selected AMD..."
	echo "Installing AMD gpu drivers..." &&
		pacman -S xf86-video-amdgpu \
			lib32-mesa \
			vulkan-radeon \
			lib32-vulkan-radeon \
			vulkan-icd-loader \
			lib32-vulkan-icd-loader
elif [ $gpu -eq 2 ]; then
	echo "You have selected NVIDIA PROPRIETARY DRIVERS..."
	echo "Installing NVIDIA PROPRIETARY DRIVERS AND UTILITIES..." &&
		pacman -S nvidia-dkms \
			nvidia-utils \
			lib32-nvidia-utils \
			nvidia-settings \
			vulkan-icd-loader \
			lib32-vulkan-icd-loader
else
	echo "Please enter a valid option"
fi

echo "#######################################################"
echo "               Driver installation complete            "
echo "#######################################################"

if [ $gameStuff -eq 1 ]; then
	echo "#######################################################"
	echo "               Installing Game related software             "
	echo "#######################################################"
	pacman -S --needed wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls \
		mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error \
		lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo \
		sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama \
		ncurses lib32-ncurses ocl-icd lib32-ocl-icd libxslt lib32-libxslt libva lib32-libva gtk3 \
		lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader steam lutris &&
		echo "#######################################################"
	echo "              Game related software Installed...            "
	echo "#######################################################"
elif [ $gameStuff -eq 2 ]; then
	echo "#######################################################"
	echo "            NOT INSTALLING STEAM AND LUTRIS            "
	echo "#######################################################"
else
	echo "Please enter a valid number"
fi
