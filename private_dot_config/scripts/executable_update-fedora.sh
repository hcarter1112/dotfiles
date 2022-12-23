#!/bin/bash
sudo dnf upgrade -y &&
echo "------------------------" &&
sudo flatpak update -y &&
# echo "------------------------" &&
# snap refresh &&
echo "------------updates finished------------" 
