#!/usr/bin/env sh

selection=$(fd . --hidden --type file $HOME 2>/dev/null | \
    sed "s;$HOME;~;" | \
    rofi -sort -sorting-method fzf -disable-history -dmenu -i -p "Search file " | \
    sed "s;\~;$HOME;"
)

xdg-open "$selection"
