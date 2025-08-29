My arch desktop setup

sudo pacman -Sy archinstall
archinstall
  >curl
  >alacritty
  >git
  >nano

git clone "https://github.com/sseaan1013/LinuxConfigs
chmod +x $HOME/LinuxConfigs/alacritty/CopyAlacrittyConfigs.sh
./$HOME/LinuxConfigs/alacritty/CopyAlacrittyConfigs.sh

curl -fsSL www.christitus.com/linux | sh
  >brave
  >neovim
  >fastfetch

sudo pacman -S i3 xorg xorg-xinit xterm
sudo nano /etc/i3/config
  >change default terminal to alacritty

touch $HOME/.xinitrc
nano touch $HOME/.xinitrc
  #!/usr/bin/env bash
  exec i3
chmod +x $HOME/.xinitrc

nano $HOME/.bash_profile
#startX
if [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx
fi

sudo reboot



















