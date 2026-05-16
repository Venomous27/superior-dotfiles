#!/bin/bash

THEME_DIR="$HOME/.config/themes"

# ── Get Theme ─────────────────────────────────

THEME=$(
    find "$THEME_DIR" -maxdepth 1 -type d ! -path "$THEME_DIR" \
    -printf "%f\n" | sort | rofi \
        -dmenu \
        -i \
        -theme ~/.config/rofi/themes/theme-switcher.rasi \
        -p "󰔎"
)

[ -z "$THEME" ] && exit

# ── Theme Paths ──────────────────────────────

SRC="$THEME_DIR/$THEME"

# Wallpaper
awww img ~/.config/themes/$THEME/wallpaper.jpg \
--transition-type wipe \
--transition-duration 1

# ── Hyprland ─────────────────────────────────

cp "$SRC/hypr.conf" \
   "$HOME/.config/hypr/themes/current.conf"

# ── Kitty ────────────────────────────────────

cp "$SRC/kitty.conf" \
   "$HOME/.config/kitty/current-theme.conf"

killall -SIGUSR1 kitty 2>/dev/null

# ── Fastfetch ────────────────────────────────

cp "$SRC/fastfetch.jsonc" \
   "$HOME/.config/fastfetch/current.jsonc"

# ──GTK / Icons────────────────────────────────
cp ~/.config/themes/$THEME/xsettingsd.conf \
~/.config/xsettingsd/xsettingsd.conf

# ──GTK CSS────────────────────────────────
cp ~/.config/themes/$THEME/gtk.css \
~/.config/gtk-3.0/gtk.css

# Apply GTK settings live
gsettings set org.gnome.desktop.interface gtk-theme \
"$(grep 'Net/ThemeName' ~/.config/xsettingsd/xsettingsd.conf | cut -d '"' -f2)"

gsettings set org.gnome.desktop.interface icon-theme \
"$(grep 'Net/IconThemeName' ~/.config/xsettingsd/xsettingsd.conf | cut -d '"' -f2)"

# ──Refresh GTK App────────────────────────────────
xfconf-query -c xsettings -p /Net/ThemeName -s "$(grep 'Net/ThemeName' ~/.config/xsettingsd/xsettingsd.conf | cut -d '"' -f2)"

xfconf-query -c xsettings -p /Net/IconThemeName -s "$(grep 'Net/IconThemeName' ~/.config/xsettingsd/xsettingsd.conf | cut -d '"' -f2)"

# ── Reload Hyprland ──────────────────────────

hyprctl reload >/dev/null 2>&1

# ── Notification ─────────────────────────────

notify-send \
    "Theme Switched To $THEME" 
