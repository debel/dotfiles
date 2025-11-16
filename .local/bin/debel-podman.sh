#!/bin/env bash

__podman_ps() {
  podman ps "$@" --format '{{ .ID }}\t{{ .State }}\t{{ .Names }}\t{{ .Image }}' |
    fzf --ansi --multi --reverse --preview 'podman inspect {1}'
}

__podman_logs() {
  podman ps "$@" --format '{{ .ID }}\t{{ .State }}\t{{ .Names }}\t{{ .Image }}' |
    fzf --ansi --multi --reverse --preview 'podman logs {1}'
}

__podman_kill() {
  podman ps "$@" --format '{{ .ID }} {{ .State }}\t{{ .Names }}\t{{ .Image }}' |
    fzf --ansi --multi --reverse --preview 'podman logs {1}' |
    cut -d" " -f 1 | xargs podman kill
}

__podman_rm() {
  podman ps "$@" --format '{{ .ID }} {{ .State }}\t{{ .Names }}\t{{ .Image }}' |
    fzf --ansi --multi --reverse --preview 'podman inspect {1}' |
    cut -d' ' -f 1 |
    xargs podman rm
}

__podman_repl() {
  podman ps "$@" --format '{{ .ID }} {{ .State }}\t{{ .Names }}\t{{ .Image }}' |
    fzf --ansi --reverse --preview 'podman inspect {1}' |
    cut -d' ' -f 1 |
    xargs -I {} podman exec -it {} /bin/bash
}

command=$1
shift 1

case "$command" in
ps) __podman_ps "$@" ;;
logs) __podman_logs "$@" ;;
kill) __podman_kill "$@" ;;
rm) __podman_rm "$@" ;;
repl) __podman_repl "$@" ;;
*) echo "supported commands are ps | logs | repl | kill | rm" ;;
esac
