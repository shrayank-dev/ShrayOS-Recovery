<#
.SYNOPSIS
    Logging System
#>

$Script:LogDirectory = Join-Path $PSScriptRoot "..\logs"
$Script:LogFile = $null

function Initialize-Logger {

    if (!(Test-Path $Script:LogDirectory)) {
        New-Item -ItemType Directory -Path $Script:LogDirectory | Out-Null
    }

    $TimeStamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"

    $Script:LogFile = Join-Path $Script:LogDirectory "$TimeStamp.log"

    New-Item -ItemType File -Path $Script:LogFile -Force | Out-Null

    Write-Log "=========================================="
    Write-Log "ShrayOS Recovery Started"
    Write-Log "Version 1.0.0"
    Write-Log "=========================================="
}

function Write-Log {

    param(
        [string]$Message
    )

    $Time = Get-Date -Format "HH:mm:ss"

    Add-Content `
        -Path $Script:LogFile `
        -Value "[$Time] $Message"
}

function Write-InfoLog {

    param(
        [string]$Message
    )

    Write-Info $Message
    Write-Log "[INFO] $Message"
}

function Write-SuccessLog {

    param(
        [string]$Message
    )

    Write-Success $Message
    Write-Log "[SUCCESS] $Message"
}

function Write-WarningLog {

    param(
        [string]$Message
    )

    Write-WarningMessage $Message
    Write-Log "[WARNING] $Message"
}

function Write-ErrorLog {

    param(
        [object]$ErrorRecord
    )

    $Message = $ErrorRecord.Exception.Message

    Write-ErrorMessage $Message

    Write-Log "[ERROR] $Message"

    if ($ErrorRecord.ScriptStackTrace) {
        Write-Log $ErrorRecord.ScriptStackTrace
    }
}
