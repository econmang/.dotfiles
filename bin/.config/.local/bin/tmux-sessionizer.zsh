#!/usr/bin/zsh

selected=$(find . -maxdepth 4 -type d | fzf)

if [[ -z $selected ]]; then
  exit 0
fi

cd "$selected"

selected_name=$(basename "$selected" | tr . _)

if tmux has-session -t=$selected_name 2> /dev/null; then
  tmux a -t $selected_name
else
  tmux new-session -s $selected_name -c "$(pwd)"
fi
