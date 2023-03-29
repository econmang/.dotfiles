#!/usr/bin/zsh

selected=$(find ~/Documents/projects/ -mindepth 1 -maxdepth 2 -type d | fzf)

if [[ -z $selected ]]; then
  exit 0
fi

selected_name=$(basename "$selected" | tr . _)

if tmux has-session -t=$selected_name 2> /dev/null; then
  tmux a -t $selected_name
else
  tmux new-session -s $selected_name -c $selected
fi
