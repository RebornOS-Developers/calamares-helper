#! /usr/bin/env sh

# Checkout a branch for the superproject and all constituent subprojects together so that they do not go out of sync
# The branch name is provided as an argument to this script

SCRIPT_DIRECTORY="$(dirname -- "$(readlink -f -- "$0")")"
PROJECT_DIRECTORY="$(dirname -- "$SCRIPT_DIRECTORY")"

CONFIGURATION_DIRECTORY="$PROJECT_DIRECTORY/calamares-configuration"
CORE_DIRECTORY="$PROJECT_DIRECTORY/calamares-core"

(cd "$CONFIGURATION_DIRECTORY" && git checkout "$1") && \
(cd "$CORE_DIRECTORY"          && git checkout "$1") && \
(cd "$SCRIPT_DIRECTORY"        && git checkout "$1")