#!/bin/bash

battery=(
  script="$PLUGIN_DIR/battery.sh"
  icon.font="$FONT:Regular:19.0"
  padding_left=$PILL_GAP
  padding_right=$PILL_GAP
  label.drawing=on
  update_freq=120
  updates=on
  background.drawing=$ITEM_PILL_DRAWING
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
  background.border_width=2
)

sketchybar --add item battery right      \
           --set battery "${battery[@]}" \
           --subscribe battery power_source_change system_woke
