+++
title = "Get module Info for a Function in Powershell v2.0"
date = 2010-01-03T07:34:00Z
updated = 2010-01-03T07:34:06Z
blogimport = true 
[author]
	name = "Paul Cassidy"
	uri = "https://plus.google.com/112112394037667071918"
+++

<pre><span style="color: #5f9ea0"><font color="#000000">This one liner will return the the module info in a easy to consume format. The info includes the full path to the module that the function is defined in. Good Time and Get-Command!!!</font></span></pre><br /><br /><pre><span style="color: #5f9ea0">Get-Command</span><span style="color: #000000"> </span><span style="color: #5f9ea0">-CommandType</span><span style="color: #000000"> </span><span style="color: #0000ff">Function</span><span style="color: #000000"> </span><span style="color: #5f9ea0">-Name</span><span style="color: #000000"> </span><span style="color: #5f9ea0">Control-FPService</span><span style="color: #000000"> </span><span style="color: #0000ff">|</span><span style="color: #000000"> </span><span style="color: #5f9ea0">Select-Object</span><span style="color: #000000"> </span><span style="color: #5f9ea0">-ExpandProperty</span><span style="color: #000000"> </span><span style="color: #0000ff">Module</span><span style="color: #000000"> </span><span style="color: #0000ff">|</span><span style="color: #000000"> </span><span style="color: #5f9ea0">Format-List</span></pre>  
