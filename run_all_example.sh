#!/bin/bash
# https://github.com/Kaderovski/shloader
# me@kaderovski.com

source ./lib/shloader.sh

shloaders=( emoji_hour emoji_face emoji_earth emoji_moon emoji_orange_pulse emoji_blue_pulse emoji_blink emoji_camera emoji_sick emoji_monkey emoji_bomb ball arrow cym x_plus line ball_wave old dots dots2 dots3 dots4 dots5 dots6 dots7 dots8 dots9 dots10 dots11 )

for i in "${shloaders[@]}"; do
  clear
  shloader -l "${i}" -m "$i" -e "\u2728 All good !" 
  sleep 1.7
  end_shloader
done
