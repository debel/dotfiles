#!/bin/sh

git branch --all --sort=-committerdate --format="%(refname:short)" |
  fzf --ansi --reverse --multi \
    --preview 'git show --color=always --stat --abbrev-commit --date=human {} --decorate;
echo "\n--- log {}...HEAD ($(git rev-parse --abbrev-ref HEAD)) ----\n";
      git log --max-count=15 --cherry-pick --color=always --graph --oneline --left-right {}...HEAD' |
  xargs
