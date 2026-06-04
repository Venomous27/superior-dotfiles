#!/usr/bin/env bash

CACHE="$HOME/.cache/cliphist-rofi"
mkdir -p "$CACHE"

selection=$(
while IFS=$'\t' read -r id desc; do

    if [[ "$desc" =~ ^\[\[\ binary ]]; then
        img="$CACHE/$id.png"

        [[ -f "$img" ]] || cliphist decode "$id" > "$img" 2>/dev/null

        printf "󰋩  Image %s\0icon\x1f%s\n" "$id" "$img"
    else
        printf "%s\n" "$desc"
    fi

done < <(cliphist list) |
rofi \
    -dmenu \
    -show-icons \
    -theme ~/.config/rofi/themes/clipboard.rasi \
    -p ""
)

[[ -z "$selection" ]] && exit

if [[ "$selection" =~ ^󰋩 ]]; then
    id=$(echo "$selection" | grep -o '[0-9]\+')
else
    id=$(cliphist list | grep -F "$selection" | head -n1 | cut -f1)
fi

cliphist decode "$id" | wl-copy
