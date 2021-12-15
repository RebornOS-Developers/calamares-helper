#! /usr/bin/env sh

SCRIPT_DIRECTORY=$(dirname -- $(readlink -f -- "$0"))

echo ""
echo "Installing the Calamares configuration package..."
echo ""
if [ ! -f "$SCRIPT_DIRECTORY/rebornos-calamares-configuration/rebornos/install_archlinux_package.sh" ];then
    >&2 echo "Please re-trace the cloning instructions in the README. The submodules have not been initialized and/or updated correctly."
    exit 1
fi
set -o xtrace
sh rebornos-calamares-configuration/rebornos/install_archlinux_package.sh "$@"
set +o xtrace

echo ""
echo "Installing the Calamares branding package..."
echo ""
if [ ! -f "$SCRIPT_DIRECTORY/rebornos-calamares-branding/rebornos/install_archlinux_package.sh" ];then
    >&2 echo "Please re-trace the cloning instructions in the README. The submodules have not been initialized and/or updated correctly."
    exit 1
fi
set -o xtrace
sh rebornos-calamares-branding/rebornos/install_archlinux_package.sh "$@"
set +o xtrace

echo ""
echo "Installing the Calamares core package..."
echo ""
if [ ! -f "$SCRIPT_DIRECTORY/rebornos-calamares-core/rebornos/install_archlinux_package.sh" ];then
    >&2 echo "Please re-trace the cloning instructions in the README. The submodules have not been initialized and/or updated correctly."
    exit 1
fi
set -o xtrace
sh rebornos-calamares-core/rebornos/install_archlinux_package.sh "$@"
set +o xtrace