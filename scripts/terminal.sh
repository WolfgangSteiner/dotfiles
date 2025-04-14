#! /usr/bin/bash
if command -v alacritty; then
    exec alacritty -o font.size=8 -e fish
else
    exec ~/.dotfiles/bin/st
fi

