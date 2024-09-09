#!/bin/sh

# Function to perform a ping test
doPingTest () {
    # Perform ping test
    ping_output=$(ping -I usb0 -c 1 8.8.8.8)

    # Check if the ping output contains "64 bytes from 8.8.8.8"
    if contains_string "$ping_output" "64 bytes from 8.8.8.8"; then
        true
    else
        false
    fi
}

ttyAdvertise () {
    cd /
    modprobe option
    cd /sys/bus/usb-serial/drivers/option1
    echo "2dee 4d23" > new_id
    sleep 2
}

# Function to check if a string contains another string
contains_string() {
    [[ $1 =~ $2 ]]
}

ttyOutput=$(ls /dev/ttyUSB*)

if contains_string "$ttyOutput" "/dev/ttyUSB2"; then
    echo "tty connections advertising"
    pingSuccess=$( doPingTest )

    if $pingSuccess; then
        echo "Ping test successful. Mobile connection established"
    else
        echo "Ping test failed."
    fi

else
    ttyAdvertise
    sleep 5
    pingSuccess=$(doPingTest)
    if $pingSuccess; then
        echo "Ping test successful. Mobile connection established"
    else
        echo "Ping test failed."
    fi
fi
