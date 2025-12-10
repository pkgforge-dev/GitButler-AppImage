#!/bin/sh

set -eu

ARCH=$(uname -m)
VERSION=$(pacman -Q gitbutler-bin | awk '{print $2; exit}') # example command to get version of application here
export ARCH VERSION
export OUTPATH=./dist
export ADD_HOOKS="self-updater.bg.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/icons/hicolor/128x128/apps/gitbutler-tauri.png
export DESKTOP=/usr/share/applications/GitButler.desktop
export DEPLOY_OPENGL=1
export DEPLOY_P11KIT=1

# Deploy dependencies
quick-sharun /usr/bin/gitbutler*

# Additional changes can be done in between here

# Turn AppDir into AppImage
quick-sharun --make-appimage
