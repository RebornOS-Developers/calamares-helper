#! /usr/bin/env sh

# Pull changes for the superproject and all the subprojects from the remote git host (currently Gitlab)

SCRIPT_DIRECTORY="$(dirname -- "$(readlink -f -- "$0")")"
PROJECT_DIRECTORY="$(dirname -- "$SCRIPT_DIRECTORY")"

(cd "$SCRIPT_DIRECTORY" && git pull --recurse-submodules)