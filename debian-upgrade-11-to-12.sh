#!/bin/bash -exu
# This script updates APT sources list to use Bookworm release and performs system upgrades

# Changes the current directory to /etc/apt/ where the APT configuration files are located
cd /etc/apt/

# Creates a backup of the original sources.list file with a timestamp in its name
cp -v /etc/apt/sources.list /etc/apt/sources.list-$(date +%m%d%Y%M%S)-bkp

# Replaces all occurrences of "bullseye" with "bookworm" in the sources.list file
sed -i s/"bullseye"/"bookworm"/g /etc/apt/sources.list

# Replaces all occurrences of "non-free" with "non-free-firmware" in the sources.list file
sed -i s/"non-free"/"non-free-firmware"/g /etc/apt/sources.list

# Executes a series of APT commands:
# - apt-get update: Updates the package lists
# - apt-get upgrade -y: Upgrades installed packages (without asking for confirmation)
# - apt-get dist-upgrade -y: Upgrades the distribution to the latest version (without asking for confirmation)
# - apt-get clean -y: Removes downloaded package files that are no longer needed
# - apt-get autoremove -y: Removes automatically installed packages that are no longer needed
# - apt-get autoclean -y: Removes old versions of installed package files
# - sync: Flushes file system buffers
# - echo "OK - Done!": Prints a success message indicating the completion of the script

apt-get update && \
	apt install zstd -y && \
	apt-get upgrade -y && \
	apt-get dist-upgrade -y && \
	apt-get clean -y && \
	apt-get autoremove -y && \
	apt-get autoclean -y && \
	sync && \
	echo "OK - Done!";