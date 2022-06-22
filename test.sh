#! /usr/bin/env sh

SCRIPT_DIRECTORY="$(dirname -- "$(readlink -f -- "$0")")"
PROJECT_DIRECTORY="$(dirname -- "$SCRIPT_DIRECTORY")"

INSTALLER_PACKAGE="calamares-core"
LOG_PATH="/root/.cache/calamares/session.log"
CALAMARES_EXECUTABLE="run_calamares.sh"
OPTIONAL_MODE=""

MODE="$(echo "$1" | tr "[:upper:]" "[:lower:]")"
if [ "$MODE" = "offline" ] || [ "$MODE" = "online" ]; then
    CALAMARES_EXECUTABLE="run_calamares.sh"
    OPTIONAL_MODE="$MODE"
    shift 1
else
    CALAMARES_EXECUTABLE="run_calamares.sh"
    OPTIONAL_MODE="online"
    shift 1
fi

LAUNCH_COMMAND=""$CALAMARES_EXECUTABLE" "$OPTIONAL_MODE" -D8 "$@""

sudo rm -f "$LOG_PATH"
if pacman -Qq "$INSTALLER_PACKAGE" > /dev/null 2>&1;then
    echo ""
    echo "Launching the Calamares installer..."
    echo ""
    set -o xtrace
    ${LAUNCH_COMMAND}
else
    echo ""
    echo "Installer packages not found. Installing and then launching the Calamares installer..."
    echo ""
    set -o xtrace
    sh "$SCRIPT_DIRECTORY"/install.sh && \
    ${LAUNCH_COMMAND}
    set +o xtrace
fi

echo ""
echo "Copying log files to ./session.log"
echo ""
if sudo ls "$LOG_PATH" > /dev/null 2>&1;then
    set -o xtrace
    sudo cp "$LOG_PATH" ./session.log
    sudo chmod 755 ./session.log
    set +o xtrace
    echo ""
    echo "Log file copied to ./session.log"
else
    echo "Log file not found in $LOG_PATH"
fi
