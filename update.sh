#! /usr/bin/env sh

# Checkout a branch for the superproject and all constituent subprojects together so that they do not go out of sync
# The branch name is provided as an argument to this script

SCRIPT_DIRECTORY="$(dirname -- "$(readlink -f -- "$0")")"
PROJECT_DIRECTORY="$(dirname -- "$SCRIPT_DIRECTORY")"

CONFIGURATION_DIRECTORY="$PROJECT_DIRECTORY/calamares-configuration"
CORE_DIRECTORY="$PROJECT_DIRECTORY/calamares-core"

(cd "$CONFIGURATION_DIRECTORY" && echo "Updating Calamares Configuration from remote..." && git pull "$@") && \
(cd "$CORE_DIRECTORY"          && echo "Updating Calamares Core from remote..." && git pull "$@") && \
(cd "$SCRIPT_DIRECTORY"        && echo "Updating Calamares Helper from remote..." && git pull "$@")