<#
.SYNOPSIS
    Console UI functions for ShrayOS Recovery.
#>

function Show-Banner {

    Clear-Host

    Write-Host ""
    Write-Host "==========================================" -ForegroundColor Cyan
    Write-Host "        SHRAYOS RECOVERY v1.0.0" -ForegroundColor Green
    Write-Host "==========================================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host " One command. Fresh Windows. Fully set up." -ForegroundColor Gray
    Write-Host ""
}

function Write-Section {

    param(
        [string]$Message
    )

    Write-Host ""
    Write-Host "========== $Message ==========" -ForegroundColor Cyan
}

function Write-Success {

    param(
        [string]$Message
    )

    Write-Host "[✓] $Message" -ForegroundColor Green
}

function Write-ErrorMessage {

    param(
        [string]$Message
    )

    Write-Host "[✗] $Message" -ForegroundColor Red
}

function Write-WarningMessage {

    param(
        [string]$Message
    )

    Write-Host "[!] $Message" -ForegroundColor Yellow
}

function Write-Info {

    param(
        [string]$Message
    )

    Write-Host "[*] $Message" -ForegroundColor Cyan
}

function Pause-Continue {

    Write-Host ""
    Read-Host "Press ENTER to continue"
}

function Show-MainMenu {

    Write-Host ""
    Write-Host "========== MAIN MENU ==========" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "1. Full System Setup"
    Write-Host "2. Install Applications"
    Write-Host "3. Windows Update"
    Write-Host "4. Install Drivers"
    Write-Host "5. Restore Settings"
    Write-Host "6. Exit"
    Write-Host ""

    $Choice = Read-Host "Select an option"

    switch ($Choice) {

        "1" {
            Write-Info "Full Setup selected."
        }

        "2" {
            Write-Info "Applications selected."
        }

        "3" {
            Write-Info "Windows Update selected."
        }

        "4" {
            Write-Info "Drivers selected."
        }

        "5" {
            Write-Info "Restore selected."
        }

        "6" {
            exit
        }

        default {
            Write-WarningMessage "Invalid selection."
        }
    }
}
