#!/bin/sh
sudo naga stop
sleep 0.3 > /dev/null 2>&1 &
echo "Deleting files"
sudo rm -f /usr/local/bin/naga
sudo rm -f /usr/local/bin/Naga_Linux/nagaXinputStart.sh
sudo rm -f /etc/udev/rules.d/80-naga.rules
sudo rm -f /usr/local/bin/Naga_Linux/nagaKillroot.sh
sudo rm -f /etc/systemd/system/naga.service
sudo rm -rf /etc/systemd/system/naga.service.d
sudo rm -f /usr/local/bin/Naga_Linux/nagaUninstall.sh
