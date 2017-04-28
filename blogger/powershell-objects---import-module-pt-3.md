+++
title = "PowerShell Objects - Import-Module Pt 3"
date = 2014-06-11T14:37:00Z
updated = 2014-06-11T14:38:29Z
tags = ["Objects", "Powershell", "Modules"]
blogimport = true 
[author]
	name = "Paul Cassidy"
	uri = "https://plus.google.com/112112394037667071918"
+++

<span style="font-family: Arial, Helvetica, sans-serif;">The -AsCustomObject switch on the New-Module Cmdlet is also available in the Import-Module which opens up a whole new world of using PowerShell objects and modules. Imagine you need to import 2 modules to work with Hyper-V and VMWare in your script but after importing them in that order you notice that Get-VM for VMWare is visiable and the Get-VM command from the Hyper-v module is hidden. The are a couple of way to handle modules with command that are the same name. One would be to use the get-command command to invoke the correct command from the correct module. My perfered way is to use the -AsCustomObject switch when importing the modules. This way I hsave the modules and there commands neatly reference in variable so that it is easy to tell which module the command i am executng is going to run against. Example (sudo-code   module names may net be correct)</span><br /><span style="font-family: Arial, Helvetica, sans-serif;"><br /></span><span style="font-family: Arial, Helvetica, sans-serif;">. <script src="http://pastebin.com/embed_js.php?i=hPYzXnPA"></script></span>
