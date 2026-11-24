#!/bin/bash

volume_icon=(
  padding_left=$PILL_GAP
  padding_right=$PILL_GAP
  icon=$VOLUME_100
  icon.align=left
  icon.color=$ICON_COLOR
  icon.font="$FONT:Regular:14.0"
  label.align=left
  label.font="$FONT:Regular:14.0"
  click_script="$PLUGIN_DIR/volume_click.sh"
  background.drawing=$ITEM_PILL_DRAWING
  background.color=$BACKGROUND_1
  background.border_color=$BACKGROUND_2
  background.border_width=2
)

volume_slider=(
  script="$PLUGIN_DIR/volume.sh"
  updates=on
  label.drawing=off
  icon.drawing=off
  slider.width=140
  slider.highlight_color=$BLUE
  slider.background.height=6
  slider.background.corner_radius=3
  slider.background.color=$BACKGROUND_2
  slider.knob=􀀁
  slider.knob.drawing=on
  padding_left=12
  padding_right=12
)

sketchybar --add item volume_icon right            \
           --set volume_icon "${volume_icon[@]}"   \
           --subscribe volume_icon volume_change   \
                                                    \
           --add slider volume popup.volume_icon   \
           --set volume "${volume_slider[@]}"      \
           --subscribe volume mouse.clicked

CURRENT_VOLUME=$(osascript -e "output volume of (get volume settings)")
sketchybar --set volume_icon label="${CURRENT_VOLUME}%" \
           --set volume slider.percentage=$CURRENT_VOLUME
