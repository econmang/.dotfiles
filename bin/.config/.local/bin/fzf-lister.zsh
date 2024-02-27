#!/usr/bin/zsh

selected=$(find . -maxdepth 4 -type d | fzf)

if [[ -z "$selected" ]]; then
  echo $(pwd)
fi

echo "$selected"
