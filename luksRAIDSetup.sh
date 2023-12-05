#!/bin/bash

# Script to setup RAID on Encrypted Drives in Ubuntu

# Check if running as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Install necessary packages
apt-get update
apt-get install -y mdadm cryptsetup

# Function to encrypt a drive
encrypt_drive() {
    local drive=$1
    echo "Encrypting $drive..."
    cryptsetup luksFormat "$drive"
    cryptsetup luksOpen "$drive" "${drive##*/}_crypt"
}

# Encrypt drives
echo "Please enter the name of the first drive (e.g., /dev/sda):"
read first_drive
encrypt_drive "$first_drive"

echo "Please enter the name of the second drive (e.g., /dev/sdb):"
read second_drive
encrypt_drive "$second_drive"

# Create RAID array
mdadm --create --verbose /dev/md0 --level=1 --raid-devices=2 /dev/mapper/"${first_drive##*/}_crypt" /dev/mapper/"${second_drive##*/}_crypt"

# Format RAID array
mkfs.ext4 /dev/md0

# Mount RAID array
mkdir -p /mnt/raid
mount /dev/md0 /mnt/raid

# Update /etc/fstab
echo "/dev/md0 /mnt/raid ext4 defaults 0 0" >> /etc/fstab

# Update RAID configuration
mdadm --detail --scan >> /etc/mdadm/mdadm.conf

echo "RAID setup on encrypted drives is complete. Please test the setup."
