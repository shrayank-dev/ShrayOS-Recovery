<#
.SYNOPSIS
    Resume Engine
#>

$Script:StateFile = Join-Path $PSScriptRoot "..\config\state.json"
$Script:State = @{}

function Initialize-State {

    if (Test-Path $Script:StateFile) {

        $Script:State = Get-Content $Script:StateFile -Raw | ConvertFrom-Json

        Write-SuccessLog "Previous state loaded."

    }
    else {

        $Script:State = @{
            Version = "1.0.0"

            CompletedSteps = @()

            LastStep = ""

            LastRun = (Get-Date)

            ResumeAvailable = $false
        }

        Save-State

        Write-InfoLog "Created new state."
    }
}

function Save-State {

    $Script:State.LastRun = Get-Date

    $Script:State |
        ConvertTo-Json -Depth 5 |
        Set-Content $Script:StateFile
}

function Complete-Step {

    param(
        [string]$Step
    )

    if ($Script:State.CompletedSteps -notcontains $Step) {

        $Script:State.CompletedSteps += $Step

    }

    $Script:State.LastStep = $Step

    $Script:State.ResumeAvailable = $true

    Save-State
}

function Test-StepCompleted {

    param(
        [string]$Step
    )

    return ($Script:State.CompletedSteps -contains $Step)
}

function Reset-State {

    Remove-Item $Script:StateFile -Force -ErrorAction SilentlyContinue

    Initialize-State
}
