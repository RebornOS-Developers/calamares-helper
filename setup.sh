#! /usr/bin/env sh

SCRIPT_DIRECTORY="$(dirname -- "$(readlink -f -- "$0")")"

set -o xtrace
<<<<<<<< HEAD:setup_all.sh
sh "$SCRIPT_DIRECTORY"/build_all.sh --install "$@"
========
sh "$SCRIPT_DIRECTORY"/build.sh --install "$@"
>>>>>>>> main:setup.sh
set +o xtrace
