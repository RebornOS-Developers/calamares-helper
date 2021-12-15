#! /usr/bin/env sh

SCRIPT_DIRECTORY=$(dirname -- $(readlink -f -- "$0"))

echo ""
echo "Building the Calamares configuration package..."
echo ""
if [ ! -f "$SCRIPT_DIRECTORY/rebornos-calamares-configuration/rebornos/build_archlinux_package.sh" ];then
    >&2 echo "Please re-trace the cloning instructions in the README. The submodules have not been initialized and/or updated correctly."
    exit 1
fi
set -o xtrace
sh rebornos-calamares-configuration/rebornos/build_archlinux_package.sh "$@"
set +o xtrace

echo ""
echo "Building the Calamares branding package..."
echo ""
if [ ! -f "$SCRIPT_DIRECTORY/rebornos-calamares-branding/rebornos/build_archlinux_package.sh" ];then
    >&2 echo "Please re-trace the cloning instructions in the README. The submodules have not been initialized and/or updated correctly."
    exit 1
fi
set -o xtrace
sh rebornos-calamares-branding/rebornos/build_archlinux_package.sh "$@"
set +o xtrace

echo ""
echo "Building the Calamares core package..."
echo ""
if [ ! -f "$SCRIPT_DIRECTORY/rebornos-calamares-core/rebornos/build_archlinux_package.sh" ];then
    >&2 echo "Please re-trace the cloning instructions in the README. The submodules have not been initialized and/or updated correctly."
    exit 1
fi
set -o xtrace
sh rebornos-calamares-core/rebornos/build_archlinux_package.sh "$@"
set +o xtrace