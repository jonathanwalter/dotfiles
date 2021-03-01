#!/bin/bash

if ! which wallpaper > /dev/null; then echo "wallpaper binary not found"; exit 1; fi

COLORS=("F5BF3D" "E16232" "6D56A0" "597CBB" "DA308D" "2E6374" "66BDA8" "BBD24D")

# number of spaces
for number in {1..8}
do
echo "Seting desktop for space ${number}"
yabai -m window --space ${number}
yabai -m space --focus ${number}
sudo wallpaper set-solid-color ${COLORS[$(($number - 1))]}
sleep 1
done