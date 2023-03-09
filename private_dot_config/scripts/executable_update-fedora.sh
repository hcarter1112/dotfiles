#!/bin/bash
sudo dnf upgrade &&
echo "------------------------" &&
sudo flatpak update -y &&
# echo "------------------------" &&
# snap refresh &&
echo "------------updates finished------------" 
