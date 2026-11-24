#!/bin/bash

calendar=(
  icon=cal
  icon.font="$FONT:Black:12.0"
  icon.padding_right=0
  label.width=45
  label.align=right
  padding_left=$PILL_GAP
  padding_right=$PILL_GAP
  update_freq=30
  script="$PLUGIN_DIR/calendar.sh"
  background.drawing=$ITEM_PILL_DRAWING
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
  background.border_width=2
)

sketchybar --add item calendar right       \
           --set calendar "${calendar[@]}" \
           --subscribe calendar system_woke
