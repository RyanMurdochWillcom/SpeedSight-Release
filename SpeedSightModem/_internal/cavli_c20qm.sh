#!/bin/sh

ttyAdvertise () {
    sleep 60
    cd /Modems/cavli-qm-serial
    echo "Executing modprobe usbserial"
    modprobe usbserial
    sleep 10
    echo "Executing insmod CavQMSerial_mod.ko"
    insmod CavQMSerial_mod.ko
}

ttyAdvertise