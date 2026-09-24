$base = Split-Path $PSScriptRoot -Parent

$auditPath = Join-Path $base "audit\offboarding"
$outputPath = Join-Path $PSScriptRoot "records.json"

$records = @()

if (Test-Path $auditPath) {

    Get-ChildItem $auditPath -Filter "*.json" -File |
        ForEach-Object {

            try {
                $record = Get-Content $_.FullName -Raw |
                    ConvertFrom-Json

                $records += $record
            }
            catch {
                Write-Warning "Unable to read $($_.FullName)"
            }
        }
}

$records |
    Sort-Object timestamp -Descending |
    ConvertTo-Json -Depth 10 |
    Set-Content $outputPath -Encoding UTF8

Write-Host "Dashboard data updated:"
Write-Host $outputPath