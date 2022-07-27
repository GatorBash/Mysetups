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
apt install tldr -y
wait
apt install bpytop -y
wait
apt install aircrack-ng -y
wait
apt install wireguard -y
wait
apt install wireguard-tools -y
wait
apt install wireguard-dkms -y
wait
apt install terminator -y
wait
apt install gnome-boxes -y
wait
apt install sl -y
