
### EXPORT ###
set -U fish_user_paths $HOME/.local/bin $HOME/Applications $fish_user_paths /home/ralldi/.config/scripts/ /home/ralldi/.cargo/bin/ /home/ralldi/.fnm/fnm
set fish_greeting                      # Supresses fish's intro message
set TERM "xterm-256color"              # Sets the terminal type
set EDITOR "lvim"      # $EDITOR use Emacs in terminal

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
  # fish_default_key_bindings
  fish_vi_key_bindings
end
### END OF VI MODE ###

####Dotfile Aliases#####

alias fish.="lvim /home/ralldi/.config/fish/config.fish"
alias bash.="lvim /home/ralldi/.bashrc"
alias scripts.="lvim /home/ralldi/.config/scripts/"
alias spotifyd.="lvim /home/ralldi/.config/spotifyd/spotifyd.conf"
alias kitty.="lvim /home/ralldi/.config/kitty/kitty.conf"
alias gdrive="google-drive-ocamlfuse ~/gdrive/"
alias rif.="lvim ~/.config/ranger/rifle.conf"
alias q.="lvim ~/.config/qtile/config.py"

####Filesystem Aliases#####

alias i="sudo nala install"
alias ls="exa -al"
# alias cat="batcat"
# alias bat="batcat"
alias hmt="ranger /home/ralldi/Documents/rclone/HmT-Mats/"

####Scripts####

alias update="update.sh"

####MISC####

alias ences="gpgtar -eco es"
alias deces="gpgtar -d es"
alias clock="tty-clock -tcs"
alias extip="curl icanhazip.com"
