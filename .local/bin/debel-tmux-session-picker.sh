#!/bin/env bash

if [ -v TMUX ]; then
  tmux choose-tree -s
else
  selected=$(
    sessions=$(tmux ls -F '#{session_name}' 2>/dev/null)

    if [ -n "$sessions" ]; then
      sessions=$(printf "%s\n[NEW SESSION]" "$sessions")
    else
      sessions="[NEW SESSION]"
    fi

    echo "$sessions" |
      fzf --reverse \
        --preview-window down,60% \
        --preview 'if [ {} == "[NEW SESSION]" ]; then echo "Create a new tmux session"; else tmux capture-pane -p -t {1} | head -20; fi'
  )

  if [ "$selected" == "[NEW SESSION]" ]; then
    tmux
  elif [ -n "$selected" ]; then
    tmux a -t "$selected"
  fi
fi
