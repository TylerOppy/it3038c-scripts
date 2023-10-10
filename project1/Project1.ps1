# Get the current date and time
$currentTime = Get-Date

# Format the current time as a string
$currentTimeString = $currentTime.ToString("yyyy-MM-dd HH:mm:ss")

# Display the current time
Write-Host "Current Date & Time: $currentTimeString"
