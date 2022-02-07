#!/bin/sh

#!/usr/bin/env bash
device1="6C:0D:E1:88:ED:93"
device2="00:1E:7C:92:E6:FC"


if bluetoothctl info "$device1" | grep 'Connected: yes' -q; then
  bluetoothctl disconnect "$device1" && notify-send "Disconnected from Oppo Enco Buds!"
  
else
  bluetoothctl connect "$device1" && notify-send "Connected to Oppo Enco Buds!"
fi


if bluetoothctl info "$device2" | grep 'Connected: yes' -q; then
  bluetoothctl disconnect "$device2" && notify-send "Disconnected from Infinity Glide 510!"
  
else
  bluetoothctl connect "$device2" && notify-send "Connected to Infinity Glide 510!"
fi




