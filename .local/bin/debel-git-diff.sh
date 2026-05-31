#!/bin/bash

set -euo pipefail

unstaged=$(git diff --name-only)
staged=$(git diff --staged --name-only)

combined=()

for s in $staged; do
  combined+=("[s] $s")
done

for u in $unstaged; do
  combined+=("[u] $u")
done

if [ ${#combined[@]} -eq 0 ]; then
  echo "nothing to diff"
  exit
fi

printf "%s\n" "${combined[@]}" | fzf --ansi --reverse --multi \
  --preview-window down,60% \
  --preview '\
      if [ {1} == "[s]" ]; then\
        git diff --staged -- {2} |\
        delta --file-style=omit --hunk-header-style=omit -n;\
      else
        git diff -- {2} |\
        delta --file-style=omit --hunk-header-style=omit -n;\
      fi' | cut -c 4- | xargs
