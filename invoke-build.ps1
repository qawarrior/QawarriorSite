#requires -Version 5.0
[CmdletBinding()]
Param (
    [Parameter()]
    [Switch] $Publish
)
$ErrorActionPreference = 'Stop'

if (Test-Path -Path './public') {
    try {
        $Error.Clear()
        Remove-Item -Path './public' -Recurse -Force
        Write-Verbose -Message "Public directory and all files it contained have been removed"
    }
    catch {
        $Error | Write-Error
    }
}

Invoke-Expression "hugo"

if ((Test-Path -Path './public') -and $Publish) {
    Copy-Item -Path './public' -Destination '../qawarrior.github.io' -Exclude '.git*' -Recurse -Force
}
