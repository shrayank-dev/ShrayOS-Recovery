<#
.SYNOPSIS
    Restore Module
#>

function Restore-Settings {

    Write-Section "Restore Settings"

    if (Test-StepCompleted "Restore") {

        Write-InfoLog "Settings already restored."

        return

    }

    Update-Progress `
        -Activity "Restore" `
        -Status "Restoring Configuration"

    Restore-VSCode

    Restore-PowerShell

    Restore-Git

    Complete-Step "Restore"

    Write-SuccessLog "Settings restored."

}

function Restore-VSCode {

    $Source = Join-Path $PSScriptRoot "..\backups\vscode"

    $Destination = Join-Path `
        $env:APPDATA `
        "Code\User"

    if (Test-Path $Source) {

        Copy-Item `
            "$Source\*" `
            $Destination `
            -Recurse `
            -Force

        Write-SuccessLog "VS Code restored."

    }

}

function Restore-PowerShell {

    $Source = Join-Path `
        $PSScriptRoot `
        "..\backups\powershell"

    $Destination = Split-Path $PROFILE

    if (Test-Path $Source) {

        Copy-Item `
            "$Source\*" `
            $Destination `
            -Recurse `
            -Force

        Write-SuccessLog "PowerShell profile restored."

    }

}

function Restore-Git {

    $Git = Join-Path `
        $PSScriptRoot `
        "..\backups\.gitconfig"

    if (Test-Path $Git) {

        Copy-Item `
            $Git `
            "$HOME\.gitconfig" `
            -Force

        Write-SuccessLog "Git configuration restored."

    }

}
