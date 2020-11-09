#!/bin/bash

wal-color() {
  (cat ~/.cache/wal/colors.json) | grep -e $1 | awk '{print substr($2, 2, 7)}'
}

bspc config normal_border_color $(wal-color 'color0')
bspc config focused_border_color $(wal-color 'color2')
bspc config active_border_color $(wal-color 'color0')
