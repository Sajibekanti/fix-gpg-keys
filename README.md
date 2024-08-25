
# `fix-gpg-keys.sh`

## Overview

The `fix-gpg-keys.sh` script is designed to resolve issues related to GPG key verification on AlmaLinux 8.5 systems. If you encounter errors such as "Public key for [package] is not installed" or "GPG check FAILED" during package installations or updates, this script helps resolve the issue.

## Why This Script?

GPG key errors typically occur if:

- The GPG keys are corrupted or incorrectly imported.
- YUM cache or metadata is outdated or conflicting.

This script automates the process of fixing these issues by reimporting the correct GPG keys, clearing outdated cache, and ensuring that YUM can properly verify and install packages.

## How to Use

1. **Download the Script**

   You can download the script using `curl` or `wget` from the GitHub repository:

   - **Using `curl`**:
     ```bash
     curl -O https://github.com/Sajibekanti/fix-gpg-keys/raw/main/fix-gpg-keys.sh
     ```

   - **Using `wget`**:
     ```bash
     wget https://github.com/Sajibekanti/fix-gpg-keys/raw/main/fix-gpg-keys.sh
     ```

2. **Make the Script Executable**

   After downloading, make the script executable:

   ```bash
   chmod +x fix-gpg-keys.sh
   ```

3. **Execute the Script**

   Run the script with root privileges:

   ```bash
   sudo ./fix-gpg-keys.sh
   ```

## Additional Information

If you continue to experience issues after running the script, manually check your repository configurations and GPG keys to ensure they are correct and up-to-date. The script assumes a default AlmaLinux 8.5 environment.
