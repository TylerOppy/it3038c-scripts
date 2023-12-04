# Get the current date and time
$currentTime = Get-Date

# Format the current time as a string
$currentTimeString = $currentTime.ToString("yyyy-MM-dd HH:mm:ss")

# Get the current user
$currentUserName = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name

# Get the hostname of the computer
$hostname = [System.Net.Dns]::GetHostName()

# Get the operating system version and build number
$osInfo = Get-CimInstance -ClassName Win32_OperatingSystem
$osVersion = $osInfo.Version
$osBuildNumber = $osInfo.BuildNumber

# Get the system architecture
$architecture = (Get-WmiObject -Class Win32_OperatingSystem).OSArchitecture

# Get the total physical memory (RAM) in gigabytes
$physicalMemory = (Get-WmiObject -Class Win32_ComputerSystem).TotalPhysicalMemory / 1GB

# Get CPU information
$cpuInfo = Get-WmiObject -Class Win32_Processor
$cpuName = $cpuInfo.Name
$cpuCores = $cpuInfo.NumberOfCores

# Get disk drive information
$diskInfo = Get-WmiObject -Class Win32_LogicalDisk
$diskInfoString = $diskInfo | ForEach-Object {
    "Drive $($_.DeviceID): $($_.Size / 1GB) GB free of $($_.FreeSpace / 1GB) GB"
}

# Get network configuration information
$networkInfo = Get-WmiObject -Class Win32_NetworkAdapterConfiguration | Where-Object { $_.IPEnabled -eq $true }
$networkInfoString = $networkInfo | ForEach-Object {
    "Network Adapter: $($_.Description)"
    "IP Address: $($_.IPAddress[0])"
    "Subnet Mask: $($_.IPSubnet[0])"
    "MAC Address: $($_.MACAddress)"
}

# Get installed software
$installedSoftware = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | 
    Select-Object DisplayName, DisplayVersion, Publisher | 
    Where-Object { $_.DisplayName -ne $null }

# Get logged-in users
$loggedInUsers = Get-WmiObject -Class Win32_ComputerSystem | Select-Object -ExpandProperty UserName

# Get running processes
$runningProcesses = Get-Process | Select-Object ProcessName, Id, CPU, WorkingSet | Sort-Object CPU -Descending | Select-Object -First 5

# Display the collected information
Write-Host "Current Date & Time: $currentTimeString"
Write-Host "Current User: $currentUserName"
Write-Host "Hostname: $hostname"
Write-Host "Operating System Version: $osVersion (Build $osBuildNumber)"
Write-Host "System Architecture: $architecture"
Write-Host "Total Physical Memory (RAM): $physicalMemory GB"
Write-Host "CPU: $cpuName ($cpuCores Cores)"
Write-Host "Disk Drives:"
$diskInfoString | ForEach-Object { Write-Host $_ }
Write-Host "Network Configuration:"
$networkInfoString | ForEach-Object { Write-Host $_ }
Write-Host "Installed Software:"
$installedSoftware | Format-Table -AutoSize | Out-String | Write-Host
Write-Host "Logged-in Users:"
$loggedInUsers | ForEach-Object { Write-Host $_ }
Write-Host "Top 5 Running Processes:"
$runningProcesses | Format-Table -AutoSize | Out-String | Write-Host
