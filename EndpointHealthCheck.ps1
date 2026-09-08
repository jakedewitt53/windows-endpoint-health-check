#Windows Endpoint Health Check
#Version 0.2
Personal PowerShell / Endpoint Administration Lab

Write-Host "======================================="
Write-Host"      Windows EndPoint Health Check
Write-Host "======================================="
Write-Host ""

$ComputerName = $env:COMPUTERNAME
$ComputerName = $env:USERNAME

Write-Host "Computer Name: $ComputerName"
Write-Host "Computer User: $CurrentUser"

Write-Host ""
Write-Host "Health check started..."
