#!/bin/bash

# Loads the colors (and layout args) of the currently active theme.
# Themes live in themes/*.sh, the active one is picked in theme.sh.
# Switch theme with: ./switch_theme.sh <dark|light|auto>

source "$HOME/.config/sketchybar/theme.sh"
source "$HOME/.config/sketchybar/themes/$(resolve_theme).sh"
