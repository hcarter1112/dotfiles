#!/bin/bash
#

./user-setup.sh &&
./install-pkgs-native.sh &&
chsh -s /usr/bin/fish &&
./enable-services.sh &&
./chezmoi-install.sh &&
./switch-ralldi 
