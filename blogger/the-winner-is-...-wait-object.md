+++
title = "The Winner is ... Wait-Object"
date = 2014-07-17T10:06:00Z
updated = 2014-07-17T10:06:50Z
blogimport = true 
[author]
	name = "Paul Cassidy"
	uri = "https://plus.google.com/112112394037667071918"
+++

I decided I like the for where is the object i was waiting for was returned, I would pass the InputObject on down the pipeline but if not Write-Error and return null. This allows me to 1. let the command run and do a null check on the return value to decide if the script should continue<br /><br />Example 1.<br />$returned = $false | Wait-Object -ScriptBlock {Test-Path C:\Wait\For\Removal } -TimeOut 10<br /><br />if($returned -ne $null) {<br />&nbsp; #do something<br />}<br />else {<br />&nbsp; #do something else<br />}<br /><br />Also this lets me use a try / catch &nbsp;with the ErrorAction set to stop causing the the catch to trigger in event of failure.<br /><br />Example 2.<br />try {<br />&nbsp; $returned = $false | Wait-Object -ScriptBlock {Test-Path C:\Wait\For\Removal } -TimeOut 10 -ErrorAction Stop<br />}<br />catch {<br />&nbsp; exit<br />}<br /><div><br /></div>Here is the Code: <script src="https://gist.github.com/qawarrior/b9acc089f0b04d1a126b.js"></script>
