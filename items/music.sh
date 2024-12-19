#!/bin/bash

music=(
	script="$PLUGIN_DIR/music.sh"
	label.padding_right=16
	label.font="JetBrainsMono Nerd Font:Bold:13.0"
	padding_right=900
	icon=􁁒
	label="Loading…"
	scroll_texts=false
	background.image=media.artwork
	background.image.scale=0.9
	background.image.corner_radius=8
	background.image.border_color="$TRANSPARENT"
	background.color="$TRANSPARENT"
	icon.padding_left=60
	label.max_chars=60
	label.align=left
	label.width=500
	--subscribe music media_change system_woke
)

sketchybar \
	--add item music center \
	--set music "${music[@]}"
