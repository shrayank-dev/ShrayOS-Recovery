<#
.SYNOPSIS
    Windows Update Module
#>

function Install-WindowsUpdates {

    Write-Section "Windows Update"

    if (Test-StepCompleted "WindowsUpdates") {

        Write-InfoLog "Windows Updates already completed."

        return

    }

    Update-Progress `
        -Activity "Windows" `
        -Status "Installing Windows Updates"

    try {

        if (!(Get-Module -ListAvailable PSWindowsUpdate)) {

            Write-InfoLog "Installing PSWindowsUpdate..."

            Install-Module `
                PSWindowsUpdate `
                -Force `
                -Scope CurrentUser

        }

        Import-Module PSWindowsUpdate -Force

        Install-WindowsUpdate `
            -AcceptAll `
            -AutoReboot:$false

        Complete-Step "WindowsUpdates"

        Write-SuccessLog "Windows Updates Installed."

    }
    catch {

        Write-ErrorLog $_

    }

}

function Update-WingetPackages {

    Write-Section "Winget Upgrade"

    if (Test-StepCompleted "WingetUpgrade") {

        Write-InfoLog "Winget already upgraded."

        return

    }

    Update-Progress `
        -Activity "Winget" `
        -Status "Updating Installed Packages"

    winget upgrade `
        --all `
        --accept-package-agreements `
        --accept-source-agreements

    Complete-Step "WingetUpgrade"

    Write-SuccessLog "All packages updated."

}
