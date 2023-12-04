# System Information PowerShell Script

## Overview

This PowerShell script gathers comprehensive system information for Windows-based systems, providing a detailed snapshot of the system's configuration. The script covers essential details such as date and time, current user, hostname, operating system version, hardware specifications, network configuration, disk drives, installed software, logged-in users, and top running processes.

## Features

### 1. Date and Time
- Retrieves and formats the current date and time in a user-friendly string.

### 2. User Information
- Identifies the current user logged into the system.

### 3. Hostname
- Retrieves the hostname of the computer.

### 4. Operating System Details
- Fetches the operating system version and build number.
- Provides information on the system architecture (32-bit or 64-bit).

### 5. Hardware Information
- Retrieves total physical memory (RAM) in gigabytes.
- Fetches CPU details, including the name and the number of cores.

### 6. Disk Drives
- Lists information about all disk drives, including size and free space.

### 7. Network Configuration
- Displays details about the network adapter, IP address, subnet mask, and MAC address.

### 8. Installed Software
- Retrieves a list of installed software, including display name, version, and publisher.

### 9. Logged-in Users
- Identifies users currently logged into the system.

### 10. Top Running Processes
- Provides information on the top 5 running processes, including process name, ID, CPU usage, and working set.

## Usage

1. Open a PowerShell console.

2. Navigate to the directory containing the script.

3. Execute the script by running the following command:
   ```powershell
   .\SystemInformationScript.ps1

## Customization

Feel free to customize the script to suit your specific requirements. You can modify or extend the script to include additional information or exclude details based on your preferences.

## Notes

Ensure that PowerShell execution policy allows script execution. You can set it using the following command:

Set-ExecutionPolicy RemoteSigned

### Author: Tyler Oppy
### Version: 1.0
### Last Updated: 12/3/2023
