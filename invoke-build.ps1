#requires -Version 5.0
[CmdletBinding()]
Param (
)

$publishDir = '/github/qawarrior.github.io'
$excludePatterns = @(
    '.git/*.*')
$expressions = @(
    "hugo --destination $publishDir", 
    "git add --all", 'git commit -m "Updated Site"', 
    'git push origin master')

$( Get-ChildItem -Path $publishDir -Recurse -Exclude $excludePattern ).FullName |
Remove-Item -Recurse -Force -ErrorAction 'SilentlyContinue'

$expressions |
ForEach-Object {
    Start-Sleep -Seconds 1  
    Invoke-Expression -Command $PSItem -Verbose
}
