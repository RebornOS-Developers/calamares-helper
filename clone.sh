#! /usr/bin/env sh

SCRIPT_DIRECTORY="$(dirname -- "$(readlink -f -- "$0")")"
PROJECT_DIRECTORY="$(dirname -- "$SCRIPT_DIRECTORY")"

OPTIONAL_MODE=""

MODE="$(echo "$1" | tr "[:upper:]" "[:lower:]")"
if [ "$MODE" = "https" ] || [ "$MODE" = "ssh" ]; then
    OPTIONAL_MODE="$MODE"
    shift 1
else
    OPTIONAL_MODE="https"
    shift 1
fi

echo ""
echo "Installing Git LFS"
echo ""
sudo pacman -S --needed git-lfs
git lfs install

if [ "$OPTIONAL_MODE" = "https" ]; then
    git clone https://github.com/RebornOS-Developers/calamares-configuration.git "$PROJECT_DIRECTORY"/calamares-configuration
    git clone https://github.com/RebornOS-Developers/calamares-core.git "$PROJECT_DIRECTORY"/calamares-core
elif [ "$OPTIONAL_MODE" = "ssh" ]; then
    git clone git@github.com:RebornOS-Developers/calamares-configuration.git "$PROJECT_DIRECTORY"/calamares-configuration
    git clone git@github.com:RebornOS-Developers/calamares-core.git "$PROJECT_DIRECTORY"/calamares-core
else
    echo "ERROR: Wrong mode. Please specify either \"https\" or \"ssh\""
    exit 1
fi