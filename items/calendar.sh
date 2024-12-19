#!/bin/bash

calendar=(
  icon.font="$FONT:Regular:12.0"
  icon.align=right
  icon.y_offset=7
  label.width=0
  label.align=right
  label.y_offset=-7
  label.font="$FONT:Black:12.0"
  label.color=$ORANGE
  padding_left=10
  update_freq=1
  script="$PLUGIN_DIR/calendar.sh"
)

sketchybar --add item calendar right \
  --set calendar "${calendar[@]}" \
  --subscribe calendar system_woke

