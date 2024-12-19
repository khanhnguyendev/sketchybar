#!/bin/bash

volume_change() {
  source "$HOME/.config/sketchybar/icons.sh"
  VOLUME=$INFO

  lwidth=70
  lpadding_left=28
  case $VOLUME in
    [6-9][0-9]|100) ICON="􀊩" ;;  # Full volume icon
    [3-5][0-9]) ICON="􀊥" 
    lwidth=60   lpadding_left=25; 
    ;;     # Medium volume icon
    [1-9]|[1-2][0-9]) ICON="􀊡" 
    lwidth=58   lpadding_left=23; 
    ;;  # Low volume icon
    *) ICON="􀊣" 
    lwidth=46   lpadding_left=20;
    ;;                 # Mute icon
  esac

  # Set the icon and label for the volume
  sketchybar --set $NAME icon="$ICON" label="$VOLUME%" label.width="$lwidth" label.padding_left="$lpadding_left"
}

case "$SENDER" in
  "volume_change") volume_change ;;
esac