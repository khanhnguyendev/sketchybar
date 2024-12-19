#!/usr/bin/env zsh

sketchybar -m \
    --add item weather e \
    --set weather \
        update_freq=300 \
        padding_right=10 \
        padding_left=10 \
        script="$PLUGIN_DIR/weather.sh" \
        icon.font="Hack Nerd Font:Regular:15.0" \
        icon.y_offset=1 \
        label.font="SF Pro:Semibold:15.0" \
        label.y_offset=1 \

