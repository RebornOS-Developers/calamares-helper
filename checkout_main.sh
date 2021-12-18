#! /usr/bin/env sh

SCRIPT_DIRECTORY="$(dirname -- "$(readlink -f -- "$0")")"

sh "$SCRIPT_DIRECTORY"/checkout.sh main "$@"