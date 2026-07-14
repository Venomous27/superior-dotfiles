#!/usr/bin/env bash

declare -A MAP

while IFS=$'\t' read -r name desc; do
    MAP["$desc"]="$name"
done < <(
    pactl list sinks | awk '
        /^Sink #/ {name=""; desc=""}
        /Name:/ {sub(/^[[:space:]]*Name:[[:space:]]*/, ""); name=$0}
        /Description:/ {
            sub(/^[[:space:]]*Description:[[:space:]]*/, "")
            desc=$0
            print name "\t" desc
        }'
)

choice=$(printf "%s\n" "${!MAP[@]}" | sort | rofi -dmenu \
    -theme /home/venom/dotfiles/rofi/.config/rofi/themes/audio-output.rasi \
    -p "󰓃 Output")
[ -z "$choice" ] && exit

pactl set-default-sink "${MAP[$choice]}"

notify-send "Default output" "$choice"
