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
for pkg in $(cat /tmp/dependencies)
do
  apt install -y $pkg
done

cat > /tmp/services << STOP
postgresql
gpsd
STOP

for service in $(cat /tmp/services)
do
  systemctl enable $service
  wait
  systemctl start $service
  wait
done

sudo msfdb init
