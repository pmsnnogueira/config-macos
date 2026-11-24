#!/bin/bash

volume_change() {
  sketchybar --set volume_icon label="${INFO}%"
  sketchybar --set volume slider.percentage=$INFO
}

mouse_clicked() {
  osascript -e "set volume output volume $PERCENTAGE"
}

case "$SENDER" in
  "volume_change") volume_change
  ;;
  "mouse.clicked") mouse_clicked
  ;;
esac
