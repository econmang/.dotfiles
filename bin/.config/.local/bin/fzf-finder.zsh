#!/usr/bin/zsh

selected=$(find . -maxdepth 4 -type d -not -path '*/.*' | fzf)

if [[ -z "$selected" ]]; then
  echo $(pwd)
fi

echo "$selected"
