#!/bin/bash
#
rm -rf /home/ralldi/.local/share/chezmoi/d* /home/ralldi/.local/share/chezmoi/p* &&
	chezmoi add \
		~/.aliases \
		~/.bashrc \
		~/.var/app/com.obsproject.Studio/config/obs-studio/ \
		~/.config/obs-studio/ \
		~/.config/dunst/ \
		~/.config/corectrl/ \
		~/.config/gsimplecal \
		~/.config/i3/ \
		~/.config/kitty/ \
		~/.config/lvim/ \
		~/.config/nvim/ \
		~/.config/nitrogen/ \
		~/.config/polybar/ \
		~/.config/fish/ \
		~/.config/qtile/ \
		~/.config/ranger/ \
		~/.config/rofi/ \
		~/.config/scripts/ \
		~/.config/sxhkd/ \
		~/.config/lf/ \
		~/.config/mimeapps.list/ \
		~/.mozilla/firefox/rodsvujp.New\ Private/ \
		~/.stumpwm.d/ \
		~/projects/ \
		~/.env \
		~/.config/rclone/ \
		~/.doom.d/ &&
	cd ~/.local/share/chezmoi/ &&
	git add --all &&
	echo "Write your commit message: " &&
	read commit &&
	git commit -m "$commit" &&
	git push -u origin main &&
	cd ~
