#!/bin/sh

# Update system
sudo apt-get update -y

# Upgrade system
sudo apt-get upgrade -y

# Download must have packages
sudo apt-get install -y git ssh tmux xinit xorg build-essential wget curl zsh zplug mpv nmcli firefox-esr newsboat neovim youtube-dl

# Dowload dwm dependencies
sudo apt-get install -y libxft-dev libx11-dev libxinerama-dev

# Go ~/bin/ and download suckless dwm, st and dmenu
mkdir -p ~/bin
mkdir -p ~/suckless
cd ~/suckless/
wget https://dl.suckless.org/dwm/dwm-6.2.tar.gz
wget https://dl.suckless.org/st/st-0.8.4.tar.gz
wget https://dl.suckless.org/tools/dmenu-5.0.tar.gz
# Extract it
tar xvf *.tar.gz
rm -r *.tar.gz
# dwm make install and link to path /bin/
cd ~/suckless/dwm*
cp config.* config.h
sudo make clean install
ln -sf ~/suckless/dwm-6.2/dwm ~/bin/dwm
# st make install and link to path /bin/
cd ~/suckless/st*
cp config.* config.h
sudo make clean install
ln -sf ~/suckless/st*/st ~/bin/st
# dmenu make install and link to path /bin/
cd ~/suckless/dmenu*
cp config.* config.h
sudo make clean install
ln -sf ~/suckless/dmenu*/dmenu ~/bin/dmenu

# Install non-free wireless driver
sudo apt-get install -y firmware-iwlwifi

# Append 'startx' to .zshrc
FILE=./misc/startx_zshrc
cat $FILE >> ~/.zshrc

# Create '.xinitrc' in ~
FILE=./dotfiles/.xinitrc
cat $FILE >> ~/.xinitrc

# Fix screen tearing - bug with Intel graphics
FILE=./misc/20-intel.conf
cat $FILE >> /etc/X11/xorg.conf.d/20-intel.conf

# Config keyboard
FILE=./misc/keyboard
cat $FILE >> /etc/default/keyboard

# Add non-free to sources-list
FILE=./misc/non-free.sources.list
cat $FILE >> /etc/apt/sources.list
