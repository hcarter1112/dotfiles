#!/bin/bash
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
    pacman -S amgpu &&
    exit_code=0

  elif [[ $gpu -eq 2 ]]
  then
    echo "You have selected NVIDIA PROPRIETARY DRIVERS..."
    echo "Installing NVIDIA PROPRIETARY DRIVERS AND UTILITIES..." &&
    pacman -S nvidia nvidia-settings &&
    exit_code=0
  else
    echo "Please enter a valid option"
  fi
done

echo "#######################################################"
echo "       Harware driver installation complete            "
echo "#######################################################"
