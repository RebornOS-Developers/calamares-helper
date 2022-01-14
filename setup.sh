#! /usr/bin/env sh

SCRIPT_DIRECTORY="$(dirname -- "$(readlink -f -- "$0")")"

set -o xtrace
sh "$SCRIPT_DIRECTORY"/build.sh --install "$@"
set +o xtrace
