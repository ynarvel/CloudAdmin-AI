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

    [string]$ActionsJson = "[]",
    [string]$VerificationJson = "[]",
    [string]$DependenciesJson = "[]",
    [string]$WarningsJson = "[]",
    [string]$ErrorsJson = "[]"
)

$base = "$env:USERPROFILE\CloudAdmin-AI"
$auditPath = Join-Path $base "audit\offboarding"

New-Item -ItemType Directory -Force $auditPath | Out-Null

function Convert-JsonArray {
    param([string]$Value)

    try {
        return $Value | ConvertFrom-Json
    }
    catch {
        return @()
    }
}

$record = [ordered]@{
    operation = "OFFBOARDING"
    timestamp = (Get-Date).ToUniversalTime().ToString("o")
    displayName = $DisplayName
    userPrincipalName = $UserPrincipalName
    objectId = $ObjectId
    actions = Convert-JsonArray $ActionsJson
    verification = Convert-JsonArray $VerificationJson
    dependencies = Convert-JsonArray $DependenciesJson
    warnings = Convert-JsonArray $WarningsJson
    errors = Convert-JsonArray $ErrorsJson
    finalStatus = $FinalStatus
}

$safeUser = $UserPrincipalName -replace '[^a-zA-Z0-9._-]', '_'
$timestamp = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"

$fileName = "${timestamp}_${safeUser}.json"
$filePath = Join-Path $auditPath $fileName

$record |
    ConvertTo-Json -Depth 10 |
    Set-Content -Path $filePath -Encoding UTF8

Write-Host ""
Write-Host "OFFBOARDING AUDIT CREATED"
Write-Host "File: $filePath"
Write-Host "Status: $FinalStatus"