#!/bin/bash

STATE_FILE="/tmp/hypr_layout_state"

get_windows() {
    hyprctl clients -j | jq -r '.[].address'
}

if [ ! -f "$STATE_FILE" ] || [ "$(cat $STATE_FILE)" = "tiled" ]; then
    for addr in $(get_windows); do
        hyprctl dispatch setfloating address:$addr
    done
    echo "floating" > "$STATE_FILE"
else
    for addr in $(get_windows); do
        hyprctl dispatch settiled address:$addr
    done
    echo "tiled" > "$STATE_FILE"
fi
