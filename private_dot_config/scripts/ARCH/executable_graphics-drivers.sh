#!/bin/bash
if [ -f /etc/pacman.conf ]
then
  mv /etc/pacman.conf /etc/pacman.conf.bak
fi
cp pacman.conf /etc/pacman.conf &&
#############
#### CPU ####
#############
exit_code=-1
while [[ $exit_code -eq -1 ]]
do
  echo "Please pick a CPU by entering a number:"
  echo "1) AMD"
  echo "2) Intel"
  read cpu
  
  if [[ $cpu -eq 1 ]]
  then
    echo "You have selected AMD..."
    echo "Installing AMD cpu drivers..." &&
    pacman -S amd-ucode &&
    exit_code=0
  elif [[ $cpu -eq 2 ]]
  then
    echo "You have selected Intel..."
    echo "Installing Intel cpu ucode..." &&
    pacman -S intel-ucode &&
    exit_code=0
  else
    echo "Please enter a valid option"
  fi
done

#############
#### GPU ####
#############

exit_code=-1
while [[ $exit_code -eq -1 ]]
do
  echo "Please pick a GPU by entering a number:"
  echo "0) NO GPU"
  echo "1) AMD"
  echo "2) NVIDIA (PROPRIETARY DRIVERS)"
  read gpu
  
  if [[ $gpu -eq 0 ]]
  then
    echo "You have selected NO GPU..."
    echo "no graphics dirvers to install... skipping..." &&
    exit_code=0

  elif [[ $gpu -eq 1 ]]
  then
    echo "You have selected AMD..."
    echo "Installing AMD gpu drivers..." &&
    pacman -S xf86-video-amdgpu \
    lib32-mesa \
    vulkan-radeon \
    lib32-vulkan-radeon \
    vulkan-icd-loader \
    lib32-vulkan-icd-loader &&
    exit_code=0

  elif [[ $gpu -eq 2 ]]
  then
    echo "You have selected NVIDIA PROPRIETARY DRIVERS..."
    echo "Installing NVIDIA PROPRIETARY DRIVERS AND UTILITIES..." &&
    pacman -S nvidia-dkms \
    nvidia-utils \
    lib32-nvidia-utils \
    nvidia-settings \
    vulkan-icd-loader \
    lib32-vulkan-icd-loader &&
    exit_code=0
  else
    echo "Please enter a valid option"
  fi
done

echo "#######################################################"
echo "       Harware driver installation complete            "
echo "#######################################################"
echo ""
echo "#######################################################"
echo "                   Installing Wine...                  "
echo "#######################################################"
pacman -S --needed wine-staging giflib lib32-giflib libpng lib32-libpng libldap lib32-libldap gnutls lib32-gnutls \
mpg123 lib32-mpg123 openal lib32-openal v4l-utils lib32-v4l-utils libpulse lib32-libpulse libgpg-error \
lib32-libgpg-error alsa-plugins lib32-alsa-plugins alsa-lib lib32-alsa-lib libjpeg-turbo lib32-libjpeg-turbo \
sqlite lib32-sqlite libxcomposite lib32-libxcomposite libxinerama lib32-libgcrypt libgcrypt lib32-libxinerama \
ncurses lib32-ncurses ocl-icd lib32-ocl-icd libxslt lib32-libxslt libva lib32-libva gtk3 \
lib32-gtk3 gst-plugins-base-libs lib32-gst-plugins-base-libs vulkan-icd-loader lib32-vulkan-icd-loader &&
echo "#######################################################"
echo "                  Wine install complete...            "
echo "#######################################################"
echo ""
echo "#######################################################"
echo "               Installing Steam and Lutris             "
echo "#######################################################"
pacman -S --needed steam lutris && 
