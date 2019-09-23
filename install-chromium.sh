#!/bin/bash

# install-chromium.sh
# version 1.0
# Install the latest Chromium.
# Devin Ulibarri

# License: AGPLv3

# To run this script, boot a Debian based distribution open a terminal, navigate to this directory, and run this
# script with:
#   sudo bash install-chromium.sh

# Based on https://libreboot.org/docs/misc/#power-management-beeps-on-thinkpads
# And based on a derivative by Michael McMahon

# Initialization checks

# Check for /bin/bash.
if [ "$BASH_VERSION" = '' ]; then
  echo "You are not using bash."
  echo "Use this syntax instead:"
  echo "sudo bash bluearchive.sh"
  exit 1
fi

# Check for root.
if [[ $EUID -ne 0 ]]; then
  echo "This script must be run as root"
  exit 1
fi

# Check networking
# https://unix.stackexchange.com/questions/190513/shell-scripting-proper-way-to-
#   check-for-internet-connectivity
echo Checking network...
if ping -q -c 1 -W 1 google.com >/dev/null; then
  echo "The network is up."
else
  echo "The network is down."
  echo "Check connection and restart script!"
  exit 1
fi

echo "Installing dependencies..."
apt update
apt install -y curl
git clone https://github.com/scheib/chromium-latest-linux

echo "Running script to install Chromium..."
cd chromium-latest-linux
./update.sh

echo "Changing permissions to user... this part may not work for you without modfications..."
cd ..
sudo chown -R user:user chromium-latest-linux/

echo "Make a backup copy of this crappy script and remove from current folder..."
mkdir ~/Documents/backup-scripts
cp install-chromium.sh ~/Documents/backup-scripts/install-chromium.sh
rm install-chromium.sh

echo "high five :) ..."
