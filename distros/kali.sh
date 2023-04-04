#!/bin/bash

if [[ $UID != 0 ]]
then
  echo 'run it as root'
  exit 1
fi

cat > /tmp/dependencies << EOF
gpsd
gpsd-tools
wireguard
wireguard-tools
dkms
wireguard-dkms
EOF

apt -q update
for pkg in $(cat /tmp/dependencies
do
  sudo apt install -y $pkg
done
echo 'done for now'
sleep 4
