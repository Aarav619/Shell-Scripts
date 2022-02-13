#!/bin/sh

#!/usr/bin/env bash

if [ "$1" == "--help" ]; then
    echo -e "\n\t--This script attempts to connect or disconnects to paired Bluetooth device."
    exit 0;
fi

menu="$(bluetoothctl paired-devices | grep '' | cut -d' ' -f3- | nl -w2 -s': ')"

echo -e "${menu}\n" && echo -ne 'Enter device number 1, 2, 3... to choose: '
read to_connect

device="$(bluetoothctl paired-devices | grep '' | cut -d' ' -f2- | awk '{print $1}' | sed -n ${to_connect}p)"

if bluetoothctl info "$device" | grep 'Connected: yes' -q; then
  bluetoothctl disconnect "$device" && info="$(bluetoothctl info ${device} | grep Name | cut -d' ' -f2-)" && notify-send "Disconnected from ${info}!"
else
  bluetoothctl connect "$device" && info="$(bluetoothctl info ${device} | grep Name | cut -d' ' -f2-)" && notify-send "Connected to ${info}!"
fi
