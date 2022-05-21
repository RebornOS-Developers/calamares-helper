#! /usr/bin/env sh

SCRIPT_DIRECTORY="$(dirname -- "$(readlink -f -- "$0")")"

OPTIONAL_MODE=""

MODE="$(echo "$1" | tr "[:upper:]" "[:lower:]")"
if [ "$MODE" = "https" ] || [ "$MODE" = "ssh" ]; then
    OPTIONAL_MODE="$MODE"
    shift 1
else
    OPTIONAL_MODE="https"
    shift 1
fi

if [ "$OPTIONAL_MODE" = "https" ]; then
    git clone https://gitlab.com/rebornos-labs/installer-and-iso/calamares/calamares-branding.git "$SCRIPT_DIRECTORY"/calamares-branding
    git clone https://gitlab.com/rebornos-labs/installer-and-iso/calamares/calamares-configuration.git "$SCRIPT_DIRECTORY"/calamares-configuration
    git clone https://gitlab.com/rebornos-labs/installer-and-iso/calamares/calamares-core.git "$SCRIPT_DIRECTORY"/calamares-core
elif [ "$OPTIONAL_MODE" = "ssh" ]; then
    git clone git@gitlab.com:rebornos-labs/installer-and-iso/calamares/calamares-branding.git calamares-branding
    git clone git@gitlab.com:rebornos-labs/installer-and-iso/calamares/calamares-configuration.git calamares-configuration
    git clone git@gitlab.com:rebornos-labs/installer-and-iso/calamares/calamares-core.git calamares-core
else
    echo "ERROR: Wrong mode. Please specify either \"https\" or \"ssh\""
    exit 1
fi