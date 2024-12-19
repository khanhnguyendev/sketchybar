#!/bin/bash

cpu_top=(
  label.font="$FONT:Semibold:7"
  label=CPU
  icon.drawing=off
  width=0
  padding_right=20
  padding_left=-50
  y_offset=-8
)

cpu_text=(
  label.font="$FONT:Semibold:8"
  label="CPU"
  y_offset=10
  padding_left=0
  width=55
  icon.drawing=off
)

cpu_percent=(
  label.font="$FONT:Semibold:13"
  label=CPU
  y_offset=-4
  padding_right=15
  padding_left=-55
  width=55
  icon.drawing=off
  update_freq=2
  mach_helper="$HELPER"
)

cpu_sys=(
  width=0
  graph.color=$RED
  graph.fill_color=$RED
  label.drawing=off
  icon.drawing=off
  padding_left=-75
  padding_right=10
  background.height=25
  background.drawing=on
  background.color=$TRANSPARENT
)

cpu_user=(
  graph.color=$BLUE
  label.drawing=off
  icon.drawing=off
  padding_left=-75
  padding_right=10
  background.height=25
  background.drawing=on
  background.color=$TRANSPARENT
)

sketchybar --add item cpu.top center              \
           --set cpu.top "${cpu_top[@]}"         \
                                                 \
           --add item cpu.text e          \
           --set cpu.text "${cpu_text[@]}"     \
                                                 \
           --add item cpu.percent e          \
           --set cpu.percent "${cpu_percent[@]}" \
                                                 \
           --add graph cpu.sys e 70          \
           --set cpu.sys "${cpu_sys[@]}"         \
                                                 \
           --add graph cpu.user e 70         \
           --set cpu.user "${cpu_user[@]}"