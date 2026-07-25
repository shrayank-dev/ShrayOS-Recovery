<#
.SYNOPSIS
    Runtime Installer
#>

function Install-Runtimes {

    Write-Section "Runtime Installation"

    if (Test-StepCompleted "Runtimes") {

        Write-InfoLog "Runtimes already installed."

        return

    }

    Update-Progress `
        -Activity "Runtimes" `
        -Status "Installing Microsoft Runtimes"

    Install-VCRedist

    Install-DotNet

    Complete-Step "Runtimes"

    Write-SuccessLog "Runtime installation complete."

}

function Install-VCRedist {

    Write-InfoLog "Installing Microsoft Visual C++ Redistributables..."

    winget install `
        Microsoft.VCRedist.2015+.x64 `
        --accept-package-agreements `
        --accept-source-agreements

    winget install `
        Microsoft.VCRedist.2015+.x86 `
        --accept-package-agreements `
        --accept-source-agreements

}

function Install-DotNet {

    Write-InfoLog "Installing .NET Runtime..."

    winget install `
        Microsoft.DotNet.Runtime.10 `
        --accept-package-agreements `
        --accept-source-agreements

}
