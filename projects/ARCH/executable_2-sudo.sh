#!/bin/bash
./variables.sh &&
	./user-setup.sh &&
	./graphics-drivers.sh &&
	./install-pkgs-native.sh &&
	./change-shell.sh &&
	./enable-services.sh &&
	./chezmoi-install.sh
