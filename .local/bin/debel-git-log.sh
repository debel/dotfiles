#!/bin/bash

set -euo pipefail

git log --graph --color=always \
  --format='%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' "$@" |
  fzf --ansi --multi --reverse \
    --preview-window down,60% \
    --preview 'echo {} | sed -n "s/^.* \([0-9a-f]\{5,40\}\) -.*$/\1/p" | xargs git show --abbrev-commit --date=human --stat -p --color=always' |
  sed -n "s/^.* \([0-9a-f]\{5,40\}\) -.*$/\1/p" | xargs
