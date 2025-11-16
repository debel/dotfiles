#!/bin/bash

while true; do
  charging=$(cat /sys/class/power_supply/AC/online)
  bat_lvl=$(cat /sys/class/power_supply/BAT0/capacity)
  if [ "$charging" -eq 0 ] && [ "$bat_lvl" -le 15 ]; then
    notify-send --urgency=CRITICAL "LOW Battery! Level: ${bat_lvl}%"
  fi
  sleep 120
done
