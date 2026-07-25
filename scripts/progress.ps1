<#
.SYNOPSIS
    Progress Manager
#>

$Script:CurrentStep = 0
$Script:TotalSteps = 1

function Initialize-Progress {

    param(
        [int]$Steps
    )

    $Script:CurrentStep = 0
    $Script:TotalSteps = $Steps

    Write-Progress `
        -Activity "ShrayOS Recovery" `
        -Status "Initializing..." `
        -PercentComplete 0
}

function Update-Progress {

    param(
        [string]$Activity,
        [string]$Status
    )

    $Script:CurrentStep++

    $Percent = [math]::Round(
        ($Script:CurrentStep / $Script:TotalSteps) * 100
    )

    Write-Progress `
        -Activity $Activity `
        -Status $Status `
        -PercentComplete $Percent
}

function Complete-Progress {

    Write-Progress `
        -Activity "ShrayOS Recovery" `
        -Completed

    Write-Success "Completed."
}
