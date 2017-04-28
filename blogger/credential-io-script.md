+++
title = "Credential IO Script"
date = 2014-05-29T08:52:00Z
updated = 2014-05-29T08:52:10Z
tags = ["Functions", "Powershell", "Projects", "Scripts", "Cmdlets"]
blogimport = true 
[author]
	name = "Paul Cassidy"
	uri = "https://plus.google.com/112112394037667071918"
+++

This is an updated version of the Import and Export Credential functions that store the creds in a json format versus the clixml format used by the original created by the guys @ powertips &amp; powershell.com. I also store them in a known location and I use a string for a look up key to store and retrieve them. This allows me to use EFS to further secure the files on the drive. Enjoy!!<br /><br /><br /><script src="http://pastebin.com/embed_js.php?i=6gZq24wX"></script>
