#! /usr/bin/env sh

# Checkout the "main" branch for the superproject and all constituent subprojects together so that they do not go out of sync

SCRIPT_DIRECTORY="$(dirname -- "$(readlink -f -- "$0")")"

sh "$SCRIPT_DIRECTORY"/checkout.sh main "$@"