#!/bin/bash

FRONT_APP_SCRIPT='sketchybar --set $NAME label="$INFO"'

front_app=(
  script="$FRONT_APP_SCRIPT"
  icon.drawing=off
  padding_left=$PILL_GAP
  padding_right=$PILL_GAP
  label.color=$LABEL_COLOR
  label.font="$FONT:Black:12.0"
  label.padding_left=$LABEL_ONLY_PADDING
  label.padding_right=$LABEL_ONLY_PADDING
  associated_display=active
  background.drawing=$ITEM_PILL_DRAWING
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
  background.border_width=2
)

sketchybar --add event window_focus            \
           --add event windows_on_spaces       \
           --add item front_app left           \
           --set front_app "${front_app[@]}"   \
           --subscribe front_app front_app_switched
