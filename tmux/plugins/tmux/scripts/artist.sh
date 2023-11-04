#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source "$CURRENT_DIR/helpers.sh"

print_artist() {
  current_artist_property "artist" $APP
}

main() {
  print_artist
}

main
