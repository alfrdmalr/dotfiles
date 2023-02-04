#!/bin/bash
pick-script() {
  local chosen=`declare -F| cut -d" " -f3 | rofi -dmenu`
  $chosen
}
