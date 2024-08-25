#!/bin/bash

# Script to fix GPG key issues on AlmaLinux 8.xx Version

# Remove the current GPG keys
echo "Removing current AlmaLinux GPG keys..."
rm -f /etc/pki/rpm-gpg/RPM-GPG-KEY-AlmaLinux
if [ $? -ne 0 ]; then
    echo "Failed to remove existing GPG keys."
    exit 1
fi
echo "GPG keys removed successfully."

# Reinstall AlmaLinux GPG keys
echo "Reinstalling AlmaLinux GPG keys..."
rpm --import https://repo.almalinux.org/almalinux/RPM-GPG-KEY-AlmaLinux
if [ $? -ne 0 ]; then
    echo "Failed to reinstall AlmaLinux GPG keys."
    exit 1
fi
echo "GPG keys reinstalled successfully."

# Remove all cached YUM data
echo "Cleaning YUM cache..."
yum clean all
if [ $? -ne 0 ]; then
    echo "Failed to clean YUM cache."
    exit 1
fi

# Remove metadata to ensure fresh retrieval
echo "Removing YUM metadata..."
yum clean metadata
if [ $? -ne 0 ]; then
    echo "Failed to remove YUM metadata."
    exit 1
fi

# Rebuild the YUM cache
echo "Rebuilding YUM cache..."
yum makecache
if [ $? -ne 0 ]; then
    echo "Failed to rebuild YUM cache."
    exit 1
fi

# Attempt to install the packages again
echo "Attempting to install the packages..."
yum install -y git perl-HTTP-Tiny
if [ $? -ne 0 ]; then
    echo "Failed to install packages. GPG check still FAILED."
    exit 1
fi

echo "Packages installed successfully."
