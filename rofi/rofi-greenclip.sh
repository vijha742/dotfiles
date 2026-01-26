#!/usr/bin/env bash

# Rofi clipboard manager using greenclip
# Usage: ./rofi-greenclip.sh

rofi -modi "clipboard:greenclip print" \
     -show clipboard \
     -run-command '{cmd}' \
     -theme themes/tokyonight.rasi
