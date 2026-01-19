#!/bin/bash -x
GOOG=$(hyprctl -j monitors | jq -r '.[] | select(.description == "Google Inc. P2718EC C8030177") | .name')
swaybg -m fill -i ~/Pictures/bg.jpg -o "${GOOG:-MISSING}" -i ~/Pictures/bg2.jpg
