#!/bin/sh

function __docker_ps {
  docker ps "$@" --format '{{ .ID }}\t{{ .State }}\t{{ .Names }}\t{{ .Image }}'\
    | fzf --ansi --multi --reverse --preview 'docker inspect {1}'
}

function __docker_logs {
  docker ps "$@" --format '{{ .ID }}\t{{ .State }}\t{{ .Names }}\t{{ .Image }}'\
    | fzf --ansi --multi --reverse --preview 'docker logs {1}'
}

function __docker_kill {
  docker ps "$@" --format '{{ .ID }} {{ .State }}\t{{ .Names }}\t{{ .Image }}'\
    | fzf --ansi --multi --reverse --preview 'docker logs {1}'\
    | cut -d" " -f 1\
    | xargs docker kill
}

function __docker_rm {
  docker ps "$@" --format '{{ .ID }} {{ .State }}\t{{ .Names }}\t{{ .Image }}'\
    | fzf --ansi --multi --reverse --preview 'docker inspect {1}'\
    | cut -d' ' -f 1 \
    | xargs docker rm
}

command=$1
shift 1

case "$command" in
  ps) __docker_ps "$@" ;;
  logs) __docker_logs "$@" ;;
  kill) __docker_kill "$@" ;;
  rm) __docker_rm "$@" ;;
  *) echo "supported commands are ps | logs | kill" ;;
esac


