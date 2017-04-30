+++
highlight = true
math = false
date = "2017-04-29T09:11:27-07:00"
title = "Wait-Object Powershell Function"
tags = ["Functions", "Powershell", "Projects", "Scripts", "Cmdlets"]

[header]
  caption = ""
  image = ""
+++

```powershell
#Requires -Version 3.0

<#
.SYNOPSIS
  Pauses execution until scriptblock returns expected object.
.DESCRIPTION
  The command will wait for a specific object to be returned from a scriptblock.
  If the object is returned the command will return the object and the script will continue
  execution but if the object is not returned before the timeout then an error record is returned
  and continuation of the script depends on ErrorAction Preference
.PARAMETER InputObject
  The Object that is expected to be returned from the scriptblock.
.PARAMETER ScriptBlock
  The scriptblock that is expected to return the object being waited on.
  The scriptblock will be invoked with one second sleeps in between invocations.
.PARAMETER TimeOut
  The number of Seconds to wait for the object to be returned.
  The command will return an error record once the Timeout value is exceeded
.EXAMPLE
  $true | Wait-Object {Test-Path C:\users\foo\file.txt} -Timeout 120
  this will wait up to 120 seconds for the test for the path to return true 
.EXAMPLE
  50 | Wait-Object {Get-Random -Min 0 -Max 99} -Timeout 90
  this example will keep invoking the scriptblock until 50 is returned or it will timeout in 90 seconds
.NOTES
  this is option 2
.FUNCTIONALITY
  a utility to help control the data flow through a script
#>
function Wait-Object {
  [CmdletBinding()]
  Param (
    [Parameter(Mandatory=$true, ValueFromPipeline=$true)]
    [ValidateNotNull()]
    [Object]
    $InputObject,
    [Parameter(Mandatory=$true)]
    [ValidateNotNull()]
    [ScriptBlock]
    $ScriptBlock,
    [ValidateRange(0,600)]
    [int]
    $TimeOut=120
  )
  
  PROCESS {
    $StartTime = [DateTime]::Now
    $EndTime = $StartTime.AddSeconds($TimeOut)
    Write-Verbose 'Waiting for the ScriptBlock to return expected object'
    while( $( & $ScriptBlock ) -ne $InputObject ) {
      Write-Verbose 'The scriptblock did not return the expected object'
      if([DateTime]::Now -gt $EndTime) {
        Write-Error "The command started at $StartTime has timed out after $TimeOut seconds"
        return $null
      }
      else {
        Start-Sleep -Seconds 1
      }
    }
    Write-Verbose 'The ScriptBlock has returned the expected object'
    return $InputObject
  }
}
```
