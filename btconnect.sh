#!/bin/sh

#!/usr/bin/env bash
if [ "$1" == "-help" ]; then
    echo -e "This script attempts to connect or disconnects to paired Bluetooth device."
    exit 0;
fi

menu="$(bluetoothctl paired-devices | grep '' | cut -d' ' -f3- | nl -w2 -s': ')"
echo -e "${menu}\n" && echo -ne 'Enter device number 1, 2 or 3 to choose: '
read to_connect

case "$to_connect" in 
	"1") device="00:1E:7C:92:E6:FC";;
	"2") device="22:22:0B:89:FF:30";;
	"3") device="6C:0D:E1:88:ED:93";;
esac

if bluetoothctl info "$device" | grep 'Connected: yes' -q; then
  bluetoothctl disconnect "$device" && info="$(bluetoothctl info ${device} | grep Name | cut -d' ' -f2-)" && notify-send "Disconnected from ${info}!"
else
  bluetoothctl connect "$device" && info="$(bluetoothctl info ${device} | grep Name | cut -d' ' -f2-)" && notify-send "Connected to $info!"
fi
