#! /usr/bin/env sh

SCRIPT_DIRECTORY="$(dirname -- "$(readlink -f -- "$0")")"
PROJECT_DIRECTORY="$(dirname -- "$SCRIPT_DIRECTORY")"

echo ""
echo "Installing Git LFS"
echo ""
sudo pacman -S --needed git-lfs
git lfs install

set -o xtrace
sh "$SCRIPT_DIRECTORY"/build.sh --install "$@"
set +o xtrace
