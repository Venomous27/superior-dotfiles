#!/usr/bin/env bash
# launcher.sh — App Launcher with toggle behavior
# Keybind: Super+Space  (add to hyprland.conf)

ROFI_BIN="rofi"
THEME="$HOME/.config/rofi/themes/launcher.rasi"

# Toggle: kill if already running
if pidof rofi > /dev/null 2>&1; then
    pkill rofi
    exit 0
fi

exec $ROFI_BIN \
    -show drun \
    -theme "$THEME" \
    -show-icons \
    -drun-display-format "{name}   <i><span weight='light' size='small' alpha='40%'>{comment}</span></i>" \
    -display-drun "  " \
    -no-fixed-num-lines \
    -i
