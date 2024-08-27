#!/bin/bash
cd /Apps/SpeedSight-Release/SpeedSightModem/_internal
rm connectionLog.log
bash ./meig_slm750_roaming.sh > connectionLog.log
echo "nameserver 8.8.8.8" | sudo tee -a /etc/resolv.conf
ifmetric ppp0 50
ifmetric wlan0 100
ifmetric eth0 150
cd /Apps/SpeedSight-Release/SpeedSightModem
echo '{"modemmodel":"slm750_roaming"}' > modemmodel.json