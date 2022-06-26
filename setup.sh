#! /usr/bin/env sh

SCRIPT_DIRECTORY="$(dirname -- "$(readlink -f -- "$0")")"
PROJECT_DIRECTORY="$(dirname -- "$SCRIPT_DIRECTORY")"

set -o xtrace
sh "$SCRIPT_DIRECTORY"/build.sh --install "$@"
set +o xtrace
