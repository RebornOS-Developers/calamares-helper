#! /usr/bin/env sh

# Build the constituent subprojects and create calamares packages (currently for Arch Linux)

SCRIPT_DIRECTORY="$(dirname -- "$(readlink -f -- "$0")")"
PROJECT_DIRECTORY="$(dirname -- "$SCRIPT_DIRECTORY")"

CONFIGURATION_SCRIPT_PATH="$PROJECT_DIRECTORY/calamares-configuration/scripts/build_package.sh"
CORE_SCRIPT_PATH="$PROJECT_DIRECTORY/calamares-core/scripts/build_package.sh"

run_build_script() {
    PACKAGE_NAME="$1"
    SCRIPT_PATH="$2"
    shift 2

    echo ""
    echo "Building the $PACKAGE_NAME package..."
    echo ""
    if [ ! -f "$SCRIPT_PATH" ];then
        >&2 echo "Please re-trace the cloning instructions in the README. The subprojects have not been initialized and/or updated correctly."
        exit 1
    fi
    set -o xtrace
    sh "$SCRIPT_PATH" "$@"
    set +o xtrace
}

sudo pacman -Sy
run_build_script "Calamares configuration" "$CONFIGURATION_SCRIPT_PATH" "$@"
run_build_script "Calamares core" "$CORE_SCRIPT_PATH" "$@"
