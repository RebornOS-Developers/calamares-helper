# Calamares

EXPERIMENTAL: Please contact shivanandvp@rebornos.org

The **Calamares Installer for RebornOS** is shipped as *three separate packages* for convenience in maintenance:

* Core
* Configuration
* Branding

This is a central git repository that holds the above three constituent repositories as *git sub-modules* so that they can be cloned together and worked on together. However, for all practical purposes, each constituent repository is independent and has its own separate remote repository, its own commits and its own git history.

For ease in identification, in each consituent repository, all packaging related code is placed under a directory called `scripts`. This is where you will find scripts for conveniently building and installing packages. Most of these will have argument pass-through so that any additional arguments can be supplied to the inner command that is called. For additional information, view the script in question for inline documentation. Additionally, the core package contains convenience scripts for configuring, building, and running the local source without packaging it. This is mainly intended for quicker testing during development. The scripts take special care to identify their actual path, even resolving any symlinks, so that you don't have to change directories with `cd` in order to execute them. A relative path is sufficient, like `rebornos-calamares-core/rebornos/build_archlinux_package.sh`.

Athough the convenience scripts can practically do everything that `makepkg` can do, advanced users can access the `PKGBUILD`under each repository by navigating to`rebornos/archlinux_packaging`. By changing to this directory, you can run `makepkg`on your own for building packages for Arch Linux. The naming of`archlinux_packaging` implies there is space for expansion into non-Arch bases.

## 1. Cloning

In order to download the source code to your local computer for testing, or for development, you can clone from the remote repository using either SSH, or HTTPS. Below are instructions on how to do so using Gitlab hosted code as remote.

### HTTPS

```bash
git clone --recurse-submodules https://gitlab.com/rebornos-labs/installer-and-iso/calamares/calamares-installer.git
```

### SSH

```bash
git clone --recurse-submodules git@gitlab.com:rebornos-labs/installer-and-iso/calamares/calamares-installer.git
```

## 2. Setup

The below script will internally call the convenience build and install scripts of each constituent repository. Make sure that you are in the project base directory (you would run something like `cd calamares-installer` after cloning).

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

The below script will update the local git repository by pulling the superproject and all submodules from the remote git repository. You would run this to retrieve all the changes made to the project by the developer(s)

```bash
sh pull.sh
```

Once done, you can proceed to [2. Setup](2-setup)
