param(
    [Parameter(Mandatory=$true)]
    [string]$DisplayName,

    [Parameter(Mandatory=$true)]
    [string]$UserPrincipalName,

    [Parameter(Mandatory=$true)]
    [string]$ObjectId,

    [Parameter(Mandatory=$true)]
    [ValidateSet(
        "SUCCESS",
        "PARTIAL_SUCCESS",
        "FAILED",
        "FAILED_VERIFICATION",
        "BLOCKED_BY_DEPENDENCY",
        "CANCELLED"
    )]
    [string]$FinalStatus,

    [string]$Actions = "",
    [string]$Verification = "",
    [string]$Dependencies = "",
    [string]$Warnings = "",
    [string]$Errors = ""
)

$base = "$env:USERPROFILE\CloudAdmin-AI"
$auditFile = Join-Path $base "audit\offboarding-record.csv"

New-Item -ItemType Directory -Force "$base\audit" | Out-Null

$record = [PSCustomObject]@{
    Timestamp    = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
    DisplayName  = $DisplayName
    UPN          = $UserPrincipalName
    ObjectId     = $ObjectId
    FinalStatus  = $FinalStatus
    Actions      = $Actions
    Verification = $Verification
    Dependencies = $Dependencies
    Warnings     = $Warnings
    Errors       = $Errors
}

if (Test-Path $auditFile) {
    $record | Export-Csv `
        -Path $auditFile `
        -NoTypeInformation `
        -Encoding UTF8 `
        -Delimiter ';' `
        -Append
}
else {
    $record | Export-Csv `
        -Path $auditFile `
        -NoTypeInformation `
        -Encoding UTF8 `
        -Delimiter ';'
}

Write-Host ""
Write-Host "OFFBOARDING CSV RECORD CREATED"
Write-Host "File: $auditFile"
Write-Host "Status: $FinalStatus"
