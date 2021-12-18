#! /usr/bin/env sh

SCRIPT_DIRECTORY="$(dirname -- "$(readlink -f -- "$0")")"

CONFIGURATION_DIRECTORY="$SCRIPT_DIRECTORY/calamares-configuration"
BRANDING_DIRECTORY="$SCRIPT_DIRECTORY/calamares-branding"
CORE_DIRECTORY="$SCRIPT_DIRECTORY/calamares-core"

(cd "$CONFIGURATION_DIRECTORY" && git checkout main) && \
(cd "$BRANDING_DIRECTORY"      && git checkout main) && \
(cd "$CORE_DIRECTORY"          && git checkout main) &&
(cd "$SCRIPT_DIRECTORY"        && git checkout main)