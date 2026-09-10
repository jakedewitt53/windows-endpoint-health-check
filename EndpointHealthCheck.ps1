#Windows Endpoint Health Check
#Version 0.2
#Personal PowerShell / Endpoint Administration Lab

Write-Host "======================================="
Write-Host       Windows EndPoint Health Check
Write-Host "======================================="
Write-Host ""

$ComputerName = $env:COMPUTERNAME
$CurrentUser = $env:USERNAME
$OS = Get-CimInstance Win32_OperatingSystem
$ComputerSystem = Get-CimInstance Win32_ComputerSystem
$Processor = Get-CimInstance Win32_Processor
$Disk = Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'"
$DiskFreePercent = [math]::Round(($Disk.FreeSpace / $Disk.Size) * 100, 2)
$Uptime = (Get-Date) - $OS.LastBootUpTime

Write-Host            System Information
Write-Host "---------------------------------------"
Write-Host "Computer Name: $ComputerName"
Write-Host "Computer User: $CurrentUser"
Write-Host "Operating System: $($OS.Caption)"
Write-Host "OS Version: $($OS.Version)"
Write-Host "Build Number: $($OS.BuildNumber)"
Write-Host "Manufacturer: $($ComputerSystem.Manufacturer)"
Write-Host "Model: $($ComputerSystem.Model)"
Write-Host "Processor: $($Processor.Name)"
Write-Host "Installed RAM: $([math]::Round($ComputerSystem.TotalPhysicalMemory / 1GB, 2)) GB"
Write-Host ""
Write-Host                 Run Time
Write-Host "---------------------------------------"
Write-Host "Last Boot: $($OS.LastBootUpTime)"
Write-Host "Uptime: $($Uptime.Days) days, $($Uptime.Hours) hours, $($Uptime.Minutes) minutes"
if ($Uptime.Days -ge 14) {
    Write-Host "Status: WARNING - Computer has not rebooted in 14 or more days."
}
else {
    Write-Host "Status: OK - Recent reboot detected."
}

Write-Host ""
Write-Host                Disk Space
Write-Host "---------------------------------------"
Write-Host "C: Drive Size: $([math]::Round($Disk.Size / 1GB, 2)) GB"
Write-Host "C: Drive Free: $([math]::Round($Disk.FreeSpace / 1GB, 2)) GB"
Write-Host "C: Drive Free Percentage: $DiskFreePercent%"
if ($DiskFreePercent -lt 15) {
    Write-Host "Disk Status: WARNING - Low disk space."
}
else {
    Write-Host "Disk Status: OK - Sufficient free space."
}

Write-Host ""
Write-Host "Health check complete..."
