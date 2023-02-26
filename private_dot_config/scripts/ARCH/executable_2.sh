#!/bin/bash
#

./user-setup.sh &&
./install-pkgs-native.sh &&
./enable-services.sh &&
./chezmoi-install.sh &&
./switch-ralldi 
