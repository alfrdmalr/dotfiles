#!/bin/bash

cx() {
  local dir=$(find * -type d | fzf)
  if [ ! -z $dir ]
    then cd $dir
  fi
}
