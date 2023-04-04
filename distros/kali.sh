#!/bin/bash

cat > /tmp/dependencies << EOF
gpsd
gpsd-tools
wireguard
wireguard-tools
dkms
wireguard-dkms

apt -q update
for pkg in $(cat /tmp/dependencies
do
  sudo apt install -y $pkg
done
