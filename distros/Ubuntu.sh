#!/bin/bash

if [[ $EUID -ne 0 ]]
then
   echo "This script must be run as root; run \"sudo -i\" this will log you into root." 
   exit 1
fi

# we are going to install a bunch of stuff that i use a lot to get work done at work and home
echo "here come the packages this is gonna take a minute on a fresh install"

apt update -y
wait
apt full-upgrade -y
wait
#help page that gives examples of common commands
apt install tldr -y
wait
#like htop or top but looks a lot nicer (similar to task manager in windows)
apt install bpytop -y
wait
#full set of aircrack tools 
apt install aircrack-ng -y
wait
#wireguard/wireguard-tools/wirguard-dkms point to point vpn client good for administering remote computers
apt install wireguard -y
wait
apt install wireguard-tools -y
wait
apt install wireguard-dkms -y
wait
#terminator terminal multiplexor quick and easy to use
apt install terminator -y
wait
#type 2 hypervisor quick and easy to use for virtual machines
apt install gnome-boxes -y
wait
#terminal toy that displays a train going across the screen helps me to slow down when i'm going to fast
apt install sl -y
wait
#tmux terminal multiplexer good for using on a remote machine saves session if you get disconnected
apt install tmux -y
wait
#neofetch displays system information with a nice graphic in the terminal
apt install neofetch -y
wait
#python3 and pip used for python package install and running python3
apt install python3 -y
wait
apt install pip -y
wait
apt install python3-pip -y
wait
#neovim updates vim(the best text editor) to neovim for some quality of life updates
apt install neovim -y
wait
#vlc media player
apt install vlc -y
wait
#Used to connect to the machine
apt install ssh -y
wait
#used for gratuitous arp
apt install arping -y
wait
#used for passive arp network collection
apt install netdiscover -y
wait
#use ping to find live hosts on a network 
apt install fping -y
wait
#in terminal file explorer
apt install ranger -y
wait
#ids
apt install snort -y
wait
#pdf viewer
apt install pdftk -y
wait
#secure messenger
wget -O- https://updates.signal.org/desktop/apt/keys.asc | sudo apt-key add -
wait
echo "deb [arch=amd64] https://updates.signal.org/desktop/apt xenial main" | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
wait
apt update -y && apt install signal-desktop -y
wait
apt install anbox -y
# install jupyter notebook
pip install notebook
jupyter notebook --generate-config
# add sed command to change line in ~/.jupyter/jupyter_notebook_config.py to c.NotebookApp.use_redirect_file = False
# this will fix an error when you try to run notebooks
apt install python3-venv -y
