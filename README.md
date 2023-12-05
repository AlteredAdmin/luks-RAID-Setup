# luks RAID Setup
 
 ## :warning: Experimental Script - Use With Caution
**Disclaimer:** This script is experimental and performs significant disk operations that can potentially erase data. Please use it with extreme caution. Ensure that you have backups of all important data before proceeding. The author is not responsible for any data loss or damage that may occur.

## Overview
`luksRAIDSetup.sh` is a shell script for Linux systems designed to set up a RAID 1 array on two encrypted hard drives. It uses LUKS (Linux Unified Key Setup) for encryption and mdadm for RAID configuration. This script is particularly useful for users who want to enhance their data security and redundancy in a Linux environment.

## Features
- **Automated Encryption**: Encrypts two drives using LUKS.
- **RAID 1 Setup**: Configures the encrypted drives into a RAID 1 array.
- **Interactive Prompts**: Asks for user input to specify drive names, ensuring a controlled setup process.
- **Easy to Use**: Simplifies complex RAID and encryption setup processes into a few easy steps.

## Prerequisites
- A Linux system (preferably Ubuntu or a similar distribution).
- `mdadm` and `cryptsetup` packages installed.
- Root or sudo privileges.
- Two hard drives for the RAID setup (ensure data backup before proceeding).

## Installation
1. Clone the repository or download the `luksRAIDSetup.sh` script.
2. Make the script executable:
   ```bash
   chmod +x luksRAIDSetup.sh
   ```
3. Run the script as root:
   ```bash
   sudo ./luksRAIDSetup.sh
   ```

## Usage
Follow the interactive prompts to specify the drives you want to encrypt and include in the RAID array. The script will guide you through the rest of the process.

## Warning
- **Data Loss**: This script will format drives, which will lead to data loss. Ensure you have backups of any important data.
- **Encryption Key**: Keep your LUKS encryption key secure. Losing this key means losing access to your data.

## Support the Developer
If you found this helpful, please consider:
- **Buymeacoffee:** [Link](http://buymeacoffee.com/alteredadmin)
