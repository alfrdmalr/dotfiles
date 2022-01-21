#!/bin/bash

cf() {
  cd $(cat ~/.favorites | fzf)
}

fav() {
  pwd >> ~/.favorites
}

favls() {
  cat ~/.favorites
}
