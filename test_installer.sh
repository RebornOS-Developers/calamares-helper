#! /usr/bin/env sh

SCRIPT_DIRECTORY="$(dirname -- "$(readlink -f -- "$0")")"

INSTALLER_PACKAGE="calamares-core"
LOG_PATH="/root/.cache/calamares/session.log"

if pacman -Qq "$INSTALLER_PACKAGE" > /dev/null 2>&1;then
    echo ""
    echo "Launching the Calamares installer..."
    echo ""
    set -o xtrace
    sudo calamares -style kvantum -X -D8 "$@"
    set +o xtrace
else
    echo ""
    echo "Installer packages not found. Installing and then launching the Calamares installer..."
    echo ""
    set -o xtrace
    sh "$SCRIPT_DIRECTORY"/install_all.sh && \
    sudo calamares -style kvantum -X -D8 "$@"
    set +o xtrace
fi

echo ""
echo "Copying log files to ./session.log"
echo ""
if sudo ls "$LOG_PATH" > /dev/null 2>&1;then
    set -o xtrace
    sudo cp "$LOG_PATH" ./session.log
    set +o xtrace
    echo ""
    echo "Log file copied to ./session.log"
else
    echo "Log file not found in $LOG_PATH"
fi
