#!/bin/bash

# Change keyboard layout
hyprctl switchxkblayout all 0

# Params
file_json="$HOME/.dotfiles/.config/waybar/config.jsonc"
stringa_da_cercare="  IT"
stringa_di_sostituzione="  US"

# Check Waybar config file
if [ ! -f "$file_json" ]; then
    notify-send "Error: $file_json does not exist"
    exit 1
fi

# Waybar string substitution
sed -i "s/${stringa_da_cercare}/${stringa_di_sostituzione}/g" "$file_json"

# Waybar reload
pkill waybar

waybar & disown

# Notify
notify-send "Keyboard layout changed to US"
