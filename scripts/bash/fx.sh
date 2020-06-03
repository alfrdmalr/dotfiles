#!/bin/bash

fx() {
  local file=$(fzf)
  if [ ! -z $file ]
    then nvim $file
  fi
}
