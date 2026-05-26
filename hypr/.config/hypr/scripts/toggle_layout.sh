#!/bin/bash

STATE_FILE="/tmp/hypr_layout_state"
FLOAT_LIST="/tmp/hypr_float_list"

# Get all window addresses
get_windows() {
    hyprctl clients -j | jq -r '.[] | .address'
}

# Get currently floating window addresses
get_floating() {
    hyprctl clients -j | jq -r '.[] | select(.floating == true) | .address'
}

if [ ! -f "$STATE_FILE" ] || [ "$(cat $STATE_FILE)" = "tiled" ]; then
    # Save which windows are currently floating
    get_floating > "$FLOAT_LIST"
   # Float all windows and bring to top
    for addr in $(get_windows); do
        hyprctl dispatch setfloating address:$addr
        hyprctl dispatch focuswindow address:$addr
    done
    echo "floating" > "$STATE_FILE"
else
    # Restore: tile everything first
    for addr in $(get_windows); do
        hyprctl dispatch settiled address:$addr
    done
    # Re-float the ones that were originally floating
    if [ -f "$FLOAT_LIST" ]; then
        while IFS= read -r addr; do
            [ -n "$addr" ] && hyprctl dispatch setfloating address:$addr
        done < "$FLOAT_LIST"
    fi
    echo "tiled" > "$STATE_FILE"
fi
