#!/usr/bin/env bash

killall -q polybar

for m in $(polybar --list-monitors | cut -d":" -f1); do
  MONITOR=$m polybar --reload alfbar &
done  

echo "Bars launched..."
