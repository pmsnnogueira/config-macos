#!/bin/sh
#
# Keep DESIRED_SPACES_PER_DISPLAY spaces on every display. Never destroys a
# space that still has windows on it -- only empty spaces are removed to
# reach the target count. If there aren't enough empty spaces to trim down
# to the desired count, the extras are left alone instead of scattering
# windows onto neighboring spaces (which is what used to happen when
# plugging/unplugging an external monitor).

DESIRED_SPACES_PER_DISPLAY=4

DISPLAYS="$(yabai -m query --displays | jq -r '.[].index')"

for d in $DISPLAYS; do
  LINES="$(yabai -m query --spaces --display "$d" | jq -r '.[] | "\(.index) \(.windows | length)"')"
  COUNT="$(printf '%s\n' "$LINES" | grep -c .)"
  LAST_SPACE="$(printf '%s\n' "$LINES" | tail -1 | awk '{print $1}')"
  MISSING=$((DESIRED_SPACES_PER_DISPLAY - COUNT))

  if [ "$MISSING" -gt 0 ]; then
    for i in $(seq 1 "$MISSING"); do
      yabai -m space --create "$LAST_SPACE"
      LAST_SPACE=$((LAST_SPACE + 1))
    done
  elif [ "$MISSING" -lt 0 ]; then
    TO_REMOVE=$((-MISSING))
    REMOVED=0
    for s in $(printf '%s\n' "$LINES" | awk '$2 == 0 {print $1}' | sort -rn); do
      [ "$REMOVED" -ge "$TO_REMOVE" ] && break
      yabai -m space --destroy "$s"
      REMOVED=$((REMOVED + 1))
    done
    # Not enough empty spaces to reach DESIRED_SPACES_PER_DISPLAY -- leave
    # the occupied ones in place rather than destroying them.
  fi
done

sketchybar --trigger space_change --trigger windows_on_spaces
