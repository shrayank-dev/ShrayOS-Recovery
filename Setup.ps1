#Requires -RunAsAdministrator

Set-StrictMode -Version 3.0
$ErrorActionPreference = "Stop"

$Version = "1.0.0"

Clear-Host

Write-Host ""
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "        SHRAYOS RECOVERY v$Version" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Cyan
Write-Host ""

Write-Host "[*] Loading..." -ForegroundColor Yellow

# Load Modules
. "$PSScriptRoot\scripts\ui.ps1"
. "$PSScriptRoot\scripts\logging.ps1"
. "$PSScriptRoot\scripts\progress.ps1"
. "$PSScriptRoot\scripts\resume.ps1"
. "$PSScriptRoot\scripts\utils.ps1"

Write-Host "[✓] Modules Loaded" -ForegroundColor Green

# Main Program Starts Here
Show-Banner
