#!/usr/bin/env bash
CONFIG_PATH="$HOME/.config/rofi/launcher.rasi"

EMOJIS_PATH="$HOME/.config/rofi/emoji-list"

line=$(cat "$EMOJIS_PATH" | rofi -dmenu -theme "$CONFIG_PATH" -i -markup-rows -p "Emoji: " -columns 6)

[[ -z "$line" ]] && exit

emoji="''${line%% *}"

echo -n "$emoji" | wl-copy

wtype -M ctrl -M shift -k v -m shift -m ctrl  '';
