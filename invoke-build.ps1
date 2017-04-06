#requires -Version 5.0
[CmdletBinding()]
Param (
)

$hugoDir = '/github/QawarriorSite'
$publishDir = '/github/qawarrior.github.io'
$excludePatterns = '.git/*.*'

function Invoke-GitCmd () {
    Invoke-Expression -Command 'git checkout master'
    Invoke-Expression -Command 'git add --all'
    Invoke-Expression -Command 'git commit -m "Updating Sources"'
}

Push-Location -Path $publishDir
Invoke-Expression -Command 'git checkout master'
Start-Sleep -Seconds 1
Pop-Location

Push-Location -Path $hugoDir
Invoke-Expression -Command "hugo --destination $publishDir"
Pop-Location

