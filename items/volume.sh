#!/bin/bash

volume=(
  script="$PLUGIN_DIR/volume.sh"
  updates=on
  padding_left=10
  padding_right=5
  icon=$VOLUME_100
  icon.width=0
  icon.align=left
  icon.color=$BLUE
  icon.font="$FONT:Regular:14.0"
  label.width=70
  label.align=right
  label.padding_left=28
  label.color=$BLUE
  label.font="$FONT:Bold:14.0"
)



sketchybar --add item volume right            \
           --set volume "${volume[@]}"   \
           --subscribe volume volume_change     \


