#!/bin/sh

#!/usr/bin/env bash
device1="6C:0D:E1:88:ED:93"
device2="00:1E:7C:92:E6:FC"


if [ "$1" == "-help" ]; then
    echo -e "This script attempts to connect or disconnects to paired Bluetooth device."
    exit 0;
fi


if bluetoothctl info "$device1" | grep 'Connected: yes' -q; then
  bluetoothctl disconnect "$device1" && info="$(bluetoothctl info ${device1} | grep Name | cut -d' ' -f2-)" && notify-send "Disconnected from ${info}!"
else
  bluetoothctl connect "$device1" && info="$(bluetoothctl info ${device1} | grep Name | cut -d' ' -f2-)" && notify-send "Connected to $info!"
fi


if bluetoothctl info "$device2" | grep 'Connected: yes' -q; then
  bluetoothctl disconnect "$device2" && info="$(bluetoothctl info $device2 | grep Name | cut -d' ' -f2-)" && notify-send "Disconnected from $info!"
  
else
  bluetoothctl connect "$device2" && info="$(bluetoothctl info ${device2} | grep Name | cut -d' ' -f2-)" && notify-send "Connected to $info!"
fi




