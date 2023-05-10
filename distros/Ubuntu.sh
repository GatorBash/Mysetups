#!/bin/bash

if [[ $EUID -ne 0 ]]
then
   echo "This script must be run as root; run \"sudo -i\" this will log you into root." 
   exit 1
fi

wget -O- https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
wait
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list

# we are going to install a bunch of stuff that i use a lot to get work done at work and home
echo "here come the packages this is gonna take a minute on a fresh install"

apt update -y
wait
cat > /tmp/pkg << EOF
tldr
bpytop
aircrack-ng
wireguard
wireguard-tools
wireguard-dkms
terminator
tmux
gnome-boxes
sl
neofetch
python3
pip
python3-pip
neovim
vlc
ssh
arping
netdiscover
fping
ranger
snort
pdftk
anbox
signal-desktop
EOF

for pkg in $(cat /tmp/pkg)
do
      if ! which $pkg
      then
            apt install $pkg -y
            wait
      fi
done
