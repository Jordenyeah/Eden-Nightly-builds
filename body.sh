#!/bin/sh -ex

BASE_DOWNLOAD_URL="https://github.com/eden-emulator/Releases/releases/download"
TAG="$FORGEJO_TAG"

linux() {
  ARCH="$1"
  PRETTY_ARCH="$2"
  DESCRIPTION="$3"

  echo -n "| "
  echo -n "[$PRETTY_ARCH](${BASE_DOWNLOAD_URL}/${TAG}/Eden-Linux-${TAG}-${ARCH}.AppImage) | "
  echo -n "$DESCRIPTION |"
  echo
}

win() {
  ARCH="$1"
  PRETTY_ARCH="$2"
  DESCRIPTION="$3"

  echo -n "| "
  echo -n "[$PRETTY_ARCH](${BASE_DOWNLOAD_URL}/${TAG}/Eden-Windows-${TAG}-${ARCH}.zip) | "
  echo -n "$DESCRIPTION |"
  echo
}

echo "## Changelog"
echo
echo "## Packages"
echo
echo "### Linux"
echo
echo "Linux packages are distributed via AppImage. Each build is optimized for a specific architecture."
echo "See the *Description* column for more info. Note that legacy builds will always work on newer systems."
echo
echo "| Build | Description |"
echo "| ----- | ----------- |"
linux legacy "amd64 (legacy)" "For CPUs older than 2013 or so"
linux amd64 "amd64" "For any modern AMD or Intel CPU"
linux steamdeck "Steam Deck" "For Steam Deck and other >= Zen 2 AMD CPUs"
linux rog-ally "ROG Ally X" "For ROG Ally X and other >= Zen 4 AMD CPUs"
linux aarch64 "armv8-a" "For ARM CPUs made in mid-2021 or earlier"
linux armv9 "armv9-a" "For ARM CPUs made in late 2021 or later"
echo
echo "### Windows"
echo
echo "Windows packages are in-place zip files."
echo
echo "| Build | Description |"
echo "| ----- | ----------- |"
win amd64 amd64 "For any Windows machine running an AMD or Intel CPU"
echo "| arm64 (WIP) | For any Windows machine running a Qualcomm or other ARM-based SoC. Currently a work-in-progress."
# win arm64 aarch64 "For any Windows machine running a Qualcomm or other ARM-based SoC"
echo
echo "### Android"
echo
echo "Android comes in a single APK."
echo
echo "[Android APK](${BASE_DOWNLOAD_URL}/${TAG}/Eden-Android-${TAG}.apk)"
echo
