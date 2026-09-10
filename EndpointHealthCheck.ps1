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

Write-Host "Computer Name: $ComputerName"
Write-Host "Computer User: $CurrentUser"
Write-Host "Operating System: $($OS.Caption)"
Write-Host "OS Version: $($OS.Version)"
Write-Host "Build Number: $($OS.BuildNumber)"
Write-Host "Manufacturer: $($ComputerSystem.Manufacturer)"
Write-Host "Model: $($ComputerSystem.Model)"
Write-Host "Processor: $($Processor.Name)"
Write-Host "Installed RAM: $([math]::Round($ComputerSystem.TotalPhysicalMemory / 1GB, 2)) GB"
Write-Host "C: Drive Size: $([math]::Round($Disk.Size / 1GB, 2)) GB"
Write-Host "C: Drive Free: $([math]::Round($Disk.FreeSpace / 1GB, 2)) GB"

Write-Host ""
Write-Host "Health check complete..."
