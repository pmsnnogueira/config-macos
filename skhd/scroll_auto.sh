#!/bin/bash
# scroll_auto.sh
# Alterna automaticamente o scroll natural entre trackpad interno e qualquer rato externo

# nome genérico do trackpad interno (confirma com ioreg)
TRACKPAD_NAME="Apple Internal Keyboard / Trackpad"

set_natural() {
  hidutil property --set '{"UserScrollInvert":1}' >/dev/null
  echo "Scroll natural (trackpad)"
}

set_non_natural() {
  hidutil property --set '{"UserScrollInvert":0}' >/dev/null
  echo "Scroll normal (mouse)"
}

while true; do
  # Verifica se o trackpad interno está presente
  TRACKPAD_CONNECTED=$(ioreg -n "$TRACKPAD_NAME" | grep -c "$TRACKPAD_NAME")

  # Verifica se existe ALGUM dispositivo com "Mouse" no nome
  MOUSE_CONNECTED=$(ioreg -p IOUSB -l | grep -i "Mouse" | wc -l)

  if [[ $MOUSE_CONNECTED -gt 0 ]]; then
    set_non_natural
  elif [[ $TRACKPAD_CONNECTED -gt 0 ]]; then
    set_natural
  fi

  sleep 2
done

