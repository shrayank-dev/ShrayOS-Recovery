<#
.SYNOPSIS
    Windows Tweaks
#>

function Apply-Tweaks {

    Write-Section "Windows Tweaks"

    if (Test-StepCompleted "Tweaks") {

        Write-InfoLog "Tweaks already applied."

        return

    }

    Update-Progress `
        -Activity "Tweaks" `
        -Status "Applying Windows Tweaks"

    Enable-DarkMode

    Show-FileExtensions

    Enable-DeveloperMode

    Show-HiddenFiles

    Enable-LongPaths

    Complete-Step "Tweaks"

    Write-SuccessLog "Windows Tweaks Applied."

}

function Enable-DarkMode {

    Write-InfoLog "Enabling Dark Mode..."

    $Path = "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize"

    Set-ItemProperty `
        -Path $Path `
        -Name AppsUseLightTheme `
        -Value 0

    Set-ItemProperty `
        -Path $Path `
        -Name SystemUsesLightTheme `
        -Value 0

    Write-SuccessLog "Dark Mode Enabled."

}

function Show-FileExtensions {

    Write-InfoLog "Showing File Extensions..."

    Set-ItemProperty `
        -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" `
        -Name HideFileExt `
        -Value 0

    Write-SuccessLog "File Extensions Enabled."

}

function Show-HiddenFiles {

    Write-InfoLog "Showing Hidden Files..."

    Set-ItemProperty `
        -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" `
        -Name Hidden `
        -Value 1

    Write-SuccessLog "Hidden Files Enabled."

}

function Enable-DeveloperMode {

    Write-InfoLog "Enabling Developer Mode..."

    New-Item `
        "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" `
        -Force | Out-Null

    Set-ItemProperty `
        -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" `
        -Name AllowDevelopmentWithoutDevLicense `
        -Value 1

    Write-SuccessLog "Developer Mode Enabled."

}

function Enable-LongPaths {

    Write-InfoLog "Enabling Long Paths..."

    Set-ItemProperty `
        -Path "HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem" `
        -Name LongPathsEnabled `
        -Value 1

    Write-SuccessLog "Long Paths Enabled."

}
