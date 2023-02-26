These are the steps for installing an ARCH system.
You can find a link to the installation guide here...

- https://wiki.archlinux.org/title/Installation_guide

1. Follow the install instructions up until pacstrap... DO NOT USE PACSTRAP YET!
2. Move the 'pkg' folder to the /var/cache/pacman/ folder
3. Install the base system using pacstap and follow the instructions until the end
  a. pacstrap /mnt base base-devel git make linux linux-lts linux-lts-headers linux-headers vim man-db networkmanager connman
4. Install the aur
  a. cd $HOME/.gitstuff
  b. git clone https://aur.archlinux.org/yay-git.git
  c. cd yay-git
  d. makepkg -si
  e. OR you can use the install yay script
5. Install you packages
  a. pacman -S --needed - < packages-native.txt
  b. yay -S --needed - < packages-aur.txt
6. Install LVIM
  a. curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
  b. curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  c. LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/fc6873809934917b470bff1b072171879899a36b/utils/installer/install.sh
7. Install chezmoi
  a. sudo su &&
  b. cd / &&
  c. sh -c "$(curl -fsLS chezmoi.io/get)" &&
  d. exit
  e. apply config files
    i. chezmoi init --apply https://github.com/hcarter1112/dotfiles 

8. Enable the services
  systemctl enable --now
7 - Last steps
  1. Go into firefox to the about:profiles page and make a new profile using the folder that you from your repo
  2. Set your background with Nitrogen if you are using a WM
  3. Set your betterlockscreen (-u) with the same wallpaper
  4. set up your crontab 
