#!/bin/bash

while true; do
  bat_lvl=$(cat /sys/class/power_supply/BAT0/capacity)
  if [ "$bat_lvl" -le 15 ]; then
    notify-send --urgency=CRITICAL "LOW Battery! Level: ${bat_lvl}%"
  fi
  sleep 120
done
