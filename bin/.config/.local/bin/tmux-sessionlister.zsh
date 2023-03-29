#!/usr/bin/zsh

selected=$(tmux list-sessions | fzf)

if [[ -z $selected ]]; then
  exit 0
fi

selected_session=$(cut -d: -f 1 <<< $selected)
tmux a -t $selected_session
