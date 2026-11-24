#!/bin/bash

sketchybar --set apple.logo popup.drawing=off --set volume_icon popup.drawing=toggle
"$HOME/.config/sketchybar/plugins/popup_autoclose.sh" volume_icon
