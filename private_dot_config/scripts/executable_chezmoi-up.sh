#!/bin/bash
#
rm -rf /home/ralldi/.local/share/chezmoi/* &&
chezmoi add \
~/.aliases \
~/.bashrc \
~/.var/app/com.obsproject.Studio/config/obs-studio/ \
~/.config/dunst/ \
~/.config/corectrl/ \
~/.config/gsimplecal \
~/.config/i3/ \
~/.config/kitty/ \
~/.config/lvim/ \
~/.config/nvim/ \
~/.config/polybar/ \
~/.config/fish/ \
~/.config/qtile/ \
~/.config/ranger/ \
~/.config/rofi/ \
~/.config/scripts/ \
~/.config/sxhkd/ \
~/.mozilla/firefox/rodsvujp.New\ Private/ \
~/.stumpwm.d/ \
~/projects/ \
~/.config/rclone/ \
~/.ssh/ \
~/.doom.d/ \
&&
cd ~/.local/share/chezmoi/ &&
git add --all &&
echo "Write your commit message: " &&
read commit &&
git commit -m "$commit" &&
git push -u origin main &&
cd ~ 
