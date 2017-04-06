#requires -Version 5.0
[CmdletBinding()]
Param (
)

$hugoSource = '/github/QawarriorSite'
$hugoOutput = '/github/qawarrior.github.io'
$excludePatterns = '.git/*.*'

Push-Location -Path $hugoSource
Invoke-Expression -Command 'git checkout master'
Invoke-Expression -Command 'git add --all'
Invoke-Expression -Command 'git commit -m "Updating Sources"'
Pop-Location

Push-Location -Path $hugoOutput
Invoke-Expression -Command 'git checkout master'
Get-ChildItem -Recurse | Remove-Item -Recurse
Pop-Location

Push-Location -Path $hugoSource
Invoke-Expression -Command "hugo --destination $hugoOutput"
Pop-Location

Push-Location -Path $hugoOutput
Invoke-Expression -Command 'git add --all'
Invoke-Expression -Command 'git commit -m "Updating Sources"'
Pop-Location
