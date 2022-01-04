#! /usr/bin/env sh

SCRIPT_DIRECTORY="$(dirname -- "$(readlink -f -- "$0")")"

(cd "$SCRIPT_DIRECTORY" && git fetch --recurse-submodules && git pull --recurse-submodules)