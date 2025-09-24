#!/bin/sh

git stash list "$@" | fzf --reverse --preview \
  'echo {} | cut -d":" -f 1 | xargs git show --color=always --decorate --abbrev-commit --date=human' \
  | cut -d":" -f 1
