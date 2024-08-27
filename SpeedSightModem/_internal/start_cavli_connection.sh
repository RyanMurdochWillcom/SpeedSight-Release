#!/bin/bash
cd /Apps/SpeedSight-Release/SpeedSightModem/_internal
rm connectionLog.log
bash ./cavli_c20qm.sh > connectionLog.log
echo "nameserver 8.8.8.8" | sudo tee -a /etc/resolv.conf
cd /Apps/SpeedSight-Release/SpeedSightModem
echo '{"modemmodel":"cavli_c20qm"}' > modemmodel.json