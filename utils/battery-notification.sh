#!/bin/bash

while true; do
    battery_level=`upower -i $(upower -e | grep 'BAT') | grep -E percentage | awk '{print $2}' | tr -d '%'`
    if [ $battery_level -le 15 ]; then
        notify-send "Battery low" "Battery level is at $battery_level%. Please charge your device."
    fi
    sleep 300
done
