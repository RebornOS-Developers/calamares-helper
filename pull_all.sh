#! /usr/bin/env sh

SCRIPT_DIRECTORY="$(dirname -- "$(readlink -f -- "$0")")"

(cd "$SCRIPT_DIRECTORY" && git pull --recurse-submodules)