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

Write-Host "Computer Name: $ComputerName"
Write-Host "Computer User: $CurrentUser"
Write-Host "Operating System: $($OS.Caption)"
Write-Host "OS Version: $($OS.Version)"
Write-Host "Build Number: $($OS.BuildNumber)"

Write-Host ""
Write-Host "Health check started..."
