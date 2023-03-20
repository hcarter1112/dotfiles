#!/bin/bash
./user-setup.sh &&
	./aur-setup.sh &&
	./graphics-drivers.sh &&
	./install-pkgs-native.sh &&
	./change-shell.sh &&
	./enable-services.sh &&
	./chezmoi-install.sh
