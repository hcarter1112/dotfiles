#!/bin/bash
## This script will start with some prompts that
# will store vaiables for software packages
# Each prompt is placed in while loop with if statements for error checking
error="Please enter a valid number"
confirm=-1
while [ $confirm -eq -1 ]
do
  ## CPU selection prompt
  exit_code=-1
  while [[ $exit_code -eq -1 ]]; do
  	echo "Please pick a CPU by entering a number:"
  	echo "1) AMD"
  	echo "2) Intel"
  	read cpu
      if [ $cpu -eq 1 ]
      then
        cpu-readout="AMD CPU"
        exit_code=0
      elif [ $cpu -eq 2 ]
      then
        cpu-readout="INTEL CPU"
        exit_code=0
      else
        echo $error
      fi
  done
  
  ## GPU Selection prompt
  exit_code=-1
  while [[ $exit_code -eq -1 ]]; do
  	echo "Please pick a GPU by entering a number:"
  	echo "0) NO GPU"
  	echo "1) AMD"
  	echo "2) NVIDIA (PROPRIETARY DRIVERS)"
  	read gpu
      if [ $gpu -eq 1 ]
      then
        gpu-readout="AMD GPU"
        exit_code=0
      elif [ $gpu -eq 2 ]
      then
        gpu-readout="NVIDIA CPU"
        exit_code=0
      elif [ $gpu -eq 0 ]
      then
        gpu-readout="NO GPU DRIVERS"
        exit_code=0
      else
        echo $error
      fi
  done
  
  ## Gaming software selection prompts
  exit_code=-1
  while [[ $exit_code -eq -1 ]]; do
  	echo "Would you like to install steam, lutris, and wine dependencies?"
  	echo "1) Yes"
  	echo "2) No"
  	read game-stuff
      if [ $game-stuff -eq 1 ]
      then
        game-stuff-readout="WILL install gaming and wine packages"
        exit_code=0
      elif [ $gpu -eq 2 ]
      then
        game-stuff-readout="WILL NOT install gaming and wine packages"
        exit_code=0
      else
        echo $error
      fi
  done
  
  ## Printing and scanning utilities (EPSON L-395)
  exit_code=-1
  while [[ $exit_code -eq -1 ]]; do
  	echo "Would you like to install printing and scanning utilities?"
  	echo "1) Yes"
  	echo "2) No"
  	read printing
      if [ $printing -eq 1 ]
      then
        printing-readout="WILL install printing and scanning utilities"
        exit_code=0
      elif [ $gpu -eq 2 ]
      then
        printing-readout="WILL NOT install printing and scanning utilities"
        exit_code=0
      else
        echo $error
      fi
  done
  ## Read out section where you can see your selected options and decide
  ## if you would like to reselect
  echo "These are the options that you have selected"
  echo "    - $cpu-readout"
  echo "    - $gpu-readout"
  echo "    - $game-stuff-readout"
  echo "    - $printing-readout"
  echo " "
  echo "Are these your desired options?"
  echo "1) Yes"
  echo "2) No"
  read ans
  if [ $ans -eq 1 ]
  then
    echo "You have confirmed your selected options..."
    echo "Now on to installation..."
    confirm=0
  elif [ $ans -eq 2 ]
  then
    echo "You will be returned to the start to reselect your options..."
  else
    echo $error
  fi
done 
  
## Installation section
echo "#######################################################"
echo "               Installing cpu and gpu drivers             "
echo "#######################################################"
if [[ $cpu -eq 1 ]]; then
	echo "You have selected AMD..."
	echo "Installing AMD cpu drivers..." &&
		pacman -S amd-ucode &&
elif [[ $cpu -eq 2 ]]; then
	echo "You have selected Intel..."
	echo "Installing Intel cpu ucode..." &&
		pacman -S intel-ucode &&
else
	echo "Please enter a valid option"
fi


if [[ $gpu -eq 0 ]]; then
	echo "You have selected NO GPU..."
	echo "no graphics dirvers to install... skipping..."
elif [[ $gpu -eq 1 ]]; then
	echo "You have selected AMD..."
	echo "Installing AMD gpu drivers..." &&
		pacman -S xf86-video-amdgpu \
			lib32-mesa \
			vulkan-radeon \
			lib32-vulkan-radeon \
			vulkan-icd-loader \
			lib32-vulkan-icd-loader 
elif [[ $gpu -eq 2 ]]; then
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


if [ $game-stuff -eq 1 ]; then
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
elif [ $game-stuff -eq 2 ]; then
	echo "#######################################################"
	echo "            NOT INSTALLING STEAM AND LUTRIS            "
	echo "#######################################################"
else
	echo "Please enter a valid number"
fi

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

