#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

print_logo() {
  echo "♫ "
  #current_track_property "album" $APP
}

main() {
  print_logo
}

main

