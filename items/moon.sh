#!/bin/bash

POPUP_OFF="sketchybar --set moon.logo popup.drawing=off"
POPUP_CLICK_SCRIPT="sketchybar --set \$NAME popup.drawing=toggle"

moon_logo=(
  script="$PLUGIN_DIR/moon.sh"
  update_freq=300
  icon.font="JetBrainsMono Nerd Font:Bold:20.0"
  icon.color=$BLUE
  icon.y_offset=1
  icon.padding_right=5
  background.drawing=off
  click_script="$POPUP_CLICK_SCRIPT"
)

apple_prefs=(
  icon=$PREFERENCES
  label="Preferences"
  click_script="open -a 'System Preferences'; $POPUP_OFF"
)

apple_activity=(
  icon=$ACTIVITY
  label="Activity"
  click_script="open -a 'Activity Monitor'; $POPUP_OFF"
)

apple_lock=(
  icon=$LOCK
  label="Lock Screen"
  click_script="pmset displaysleepnow; $POPUP_OFF"
)

sketchybar --add item moon.logo left                  \
           --set moon.logo "${moon_logo[@]}"         \
                                                       \
           --add item apple.prefs popup.moon.logo     \
           --set apple.prefs "${apple_prefs[@]}"       \
                                                       \
           --add item apple.activity popup.moon.logo  \
           --set apple.activity "${apple_activity[@]}" \
                                                       \
           --add item apple.lock popup.moon.logo      \
           --set apple.lock "${apple_lock[@]}"