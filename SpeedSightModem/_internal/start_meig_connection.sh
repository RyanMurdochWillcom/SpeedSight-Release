#!/bin/bash
cd /Apps/SpeedSight-Release/SpeedSightModem/_internal
rm connectionLog.log
bash ./meig_slm750.sh > connectionLog.log
echo "nameserver 8.8.8.8" | sudo tee -a /etc/resolv.conf
ifmetric ppp0 50
ifmetric wlan0 100
ifmetric eth0 150
echo '{"modemmodel":"slm750"}' > modemmodel.json