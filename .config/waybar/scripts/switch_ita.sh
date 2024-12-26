#!/bin/bash

# Change keyboard layout
hyprctl switchxkblayout all 1

# Params
file_json="$HOME/.dotfiles/.config/waybar/config.jsonc"
stringa_da_cercare="  US"
stringa_di_sostituzione="  IT"

# Check Waybar config file
if [ ! -f "$file_json" ]; then
    echo "Errore: il file $file_json non esiste."
    exit 1
fi

# Waybar string substitution
sed -i "s/${stringa_da_cercare}/${stringa_di_sostituzione}/g" "$file_json"

# Waybar reload
reloald_waybar

# Notify
notify-send "Keyboard layout changed to ITA"
