#!/usr/bin/zsh

selected=$(find ~/ | fzf)

if [[ -z $selected ]]; then
  exit 0
fi

nvim $selected
