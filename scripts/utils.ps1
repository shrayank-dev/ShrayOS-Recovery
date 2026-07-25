<#
.SYNOPSIS
    Utility Functions
#>

function Test-Administrator {

    $Identity = [Security.Principal.WindowsIdentity]::GetCurrent()

    $Principal = New-Object Security.Principal.WindowsPrincipal($Identity)

    if ($Principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {

        Write-SuccessLog "Running as Administrator."

    }
    else {

        Write-ErrorMessage "Administrator privileges are required."

        Pause-Continue

        exit
    }
}

function Test-Internet {

    Write-Info "Checking Internet..."

    $Connected = Test-Connection `
        -TargetName "8.8.8.8" `
        -Quiet `
        -Count 1

    if ($Connected) {

        Write-SuccessLog "Internet Connected."

    }
    else {

        Write-ErrorMessage "No Internet Connection."

        Pause-Continue

        exit
    }
}

function Test-Winget {

    Write-Info "Checking Winget..."

    $Winget = Get-Command winget -ErrorAction SilentlyContinue

    if ($Winget) {

        Write-SuccessLog "Winget Found."

    }
    else {

        Write-ErrorMessage "Winget is not installed."

        Pause-Continue

        exit
    }
}

function Ensure-Folder {

    param(
        [string]$Path
    )

    if (!(Test-Path $Path)) {

        New-Item `
            -ItemType Directory `
            -Path $Path `
            -Force | Out-Null

        Write-InfoLog "Created folder: $Path"
    }
}

function Get-TimeStamp {

    Get-Date -Format "yyyy-MM-dd HH:mm:ss"
}

function Restart-IfRequired {

    if ($global:NeedsRestart) {

        Write-WarningMessage "A restart is required."

        $Choice = Read-Host "Restart now? (Y/N)"

        if ($Choice -eq "Y") {

            Restart-Computer -Force

        }
    }
}
