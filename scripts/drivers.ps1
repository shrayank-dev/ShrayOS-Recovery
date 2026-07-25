<#
.SYNOPSIS
    Driver Installation Module
#>

function Install-Drivers {

    Write-Section "Drivers"

    if (Test-StepCompleted "Drivers") {

        Write-InfoLog "Drivers already installed."

        return

    }

    Update-Progress `
        -Activity "Drivers" `
        -Status "Installing Driver Software"

    Install-Lenovo

    Install-NVIDIA

    Complete-Step "Drivers"

    Write-SuccessLog "Driver installation complete."

}

function Install-Lenovo {

    Write-InfoLog "Installing Lenovo software..."

    winget install `
        --id Lenovo.SystemUpdate `
        -e `
        --accept-package-agreements `
        --accept-source-agreements

}

function Install-NVIDIA {

    Write-InfoLog "Installing NVIDIA App..."

    winget install `
        NVIDIA.NVIDIAApp `
        --accept-package-agreements `
        --accept-source-agreements

}
