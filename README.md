# Calamares

EXPERIMENTAL: Please contact shivanandvp@rebornos.org

The **Calamares Installer for RebornOS** is shipped as *two separate packages* for convenience in maintenance:

* calamares-core
* calamares-configuration

This is a central git repository that pulls the above two repositories as folders so that they can be cloned together. However, each of those can be edited independently since each folder has its own separate remote repository, its own commits, and its own git history.

For ease in identification, in each consituent repository, all packaging related code is placed under a directory called `scripts`. This is where you will find scripts for conveniently building and installing packages. Most of these will have argument pass-through so that any additional arguments like `--noconfirm` can be supplied to the inner command that is called. For additional information, view the script in question for inline documentation. Additionally, the calamares-core package contains convenience scripts for configuring, building, and running the local source without packaging it. This is mainly intended for quicker testing during development. The scripts take special care to identify their actual path, even resolving any symlinks, so that you don't have to change directories with `cd` in order to execute them. A relative path is sufficient, like `calamares-core/scripts/setup.sh`.

Athough the convenience scripts can practically do everything that `makepkg` can do, advanced users can access the `PKGBUILD`under each repository by navigating to`scripts/packaging`. By changing to this directory, you can run `makepkg`on your own for building packages for Arch Linux. The naming of`packaging` implies there is space for expansion into non-Arch bases.

## 1. Cloning

In order to download the source code to your local computer for testing, or for development, you can clone from the remote repository using either SSH, or HTTPS. Below are instructions on how to do so using Gitlab hosted code as remote.

### HTTPS

```bash
git clone https://gitlab.com/rebornos-labs/deployment/calamares/calamares-helper.git

sh calamares-helper/clone.sh # For cloning subprojects
```

### SSH

```bash
git clone git@gitlab.com:rebornos-labs/deployment/calamares/calamares-helper.git

sh calamares-helper/clone.sh ssh # For cloning subprojects
```

## (Optional) VSCode Workspace

If you followed the above cloning process correctly (*including running the clone script* - **necessary**),
then open `calamares-helper/Installer.code-workspace` on Visual Studio Code.

The above file automatically recognizes all the local installer git repositories and displays them within the VSCode workspace.

## 2. Build

The below script will internally call the convenience build scripts of each constituent repository. Make sure that you are in the project base directory (you would have had to run something like `cd calamares-helper` after cloning).

```bash
sh build.sh
```

## (Alternative to build, Optional) Setup

The below script will internally call the convenience build and install scripts of each constituent repository. Make sure that you are in the project base directory (you would have had to run something like `cd calamares-helper` after cloning).

```bash
sh setup.sh
```

## 3. Testing

The `test.sh` script will run the installer and will automatically copy the log file (`session.log`) to the current directory.

```bash
sh test.sh
```

Optionally, you can specify whether you would like to run in `offline` or `online` mode by specifying it as the first commandline argument to the above script. For example:

```bash
sh test.sh offline
```

or

```bash
sh test.sh online
```

> Note: You can also run the Calamares installer from the desktop icon. Search your launcher, start-menu or app-grid for `RebornOS Installer (Calamares)` and launch it by clicking.

## 4. Updating

The below script will update the local git repository by pulling the helper, the core, and the configuration from the remote git repository. You would run this to retrieve all the changes made to the project by the developer(s)

```bash
sh update.sh
```

Once done, you can proceed to [2. Build](2-build)
