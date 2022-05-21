#! /usr/bin/env sh

# Checkout the "dev" branch for the superproject and all constituent subprojects together so that they do not go out of sync

SCRIPT_DIRECTORY="$(dirname -- "$(readlink -f -- "$0")")"
PROJECT_DIRECTORY="$(dirname -- "$SCRIPT_DIRECTORY")"

sh "$SCRIPT_DIRECTORY"/checkout.sh dev "$@"