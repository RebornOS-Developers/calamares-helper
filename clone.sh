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

if [ "$OPTIONAL_MODE" = "https" ]; then
    git clone https://gitlab.com/rebornos-labs/installer-and-iso/calamares/calamares-branding.git "$PROJECT_DIRECTORY"/calamares-branding
    git clone https://gitlab.com/rebornos-labs/installer-and-iso/calamares/calamares-configuration.git "$PROJECT_DIRECTORY"/calamares-configuration
    git clone https://gitlab.com/rebornos-labs/installer-and-iso/calamares/calamares-core.git "$PROJECT_DIRECTORY"/calamares-core
elif [ "$OPTIONAL_MODE" = "ssh" ]; then
    git clone git@gitlab.com:rebornos-labs/installer-and-iso/calamares/calamares-branding.git "$PROJECT_DIRECTORY"/calamares-branding
    git clone git@gitlab.com:rebornos-labs/installer-and-iso/calamares/calamares-configuration.git "$PROJECT_DIRECTORY"/calamares-configuration
    git clone git@gitlab.com:rebornos-labs/installer-and-iso/calamares/calamares-core.git "$PROJECT_DIRECTORY"/calamares-core
else
    echo "ERROR: Wrong mode. Please specify either \"https\" or \"ssh\""
    exit 1
fi