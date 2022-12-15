#!/bin/bash
sudo nala update &&
sudo nala upgrade &&
echo "------------------------" &&
flatpak update &&
echo "------------------------" &&
snap refresh &&
echo "------------updates finished------------" 
