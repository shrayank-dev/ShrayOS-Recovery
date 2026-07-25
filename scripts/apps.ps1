<#
.SYNOPSIS
    Application Installer
#>

function Install-Applications {

    Write-Section "Application Installation"

    if (Test-StepCompleted "Applications") {

        Write-InfoLog "Applications already installed."

        return
    }

    $AppsFile = Join-Path $PSScriptRoot "..\apps.json"

    if (!(Test-Path $AppsFile)) {

        Write-ErrorMessage "apps.json not found."

        return
    }

    Update-Progress `
        -Activity "Applications" `
        -Status "Importing apps.json"

    Write-InfoLog "Installing applications..."

    winget import `
        -i $AppsFile `
        --ignore-versions `
        --ignore-unavailable `
        --accept-package-agreements `
        --accept-source-agreements

    if ($LASTEXITCODE -eq 0) {

        Complete-Step "Applications"

        Write-SuccessLog "Applications installed."

    }
    else {

        Write-ErrorMessage "One or more applications failed."

    }

}
