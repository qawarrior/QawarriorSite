+++
title = "A Couple Annoyances in Powershell V2.0"
date = 2010-01-03T07:44:00Z
updated = 2010-01-03T07:44:40Z
blogimport = true 
[author]
	name = "Paul Cassidy"
	uri = "https://plus.google.com/112112394037667071918"
+++

<p>I love Powershell I have written thousands of lines of code in it. I have used most of the great new features that were introduced into v2.0 but I have came across I couple of things that just annoy me. The first is that powershell provides lots of built in or automatic variables one of those new to v2.0 is the PsScriptRoot variable. You would think that with this name it would give you the Root of the Script that is running….Well sort of it only works in psm1 or module file. Why is it not $PsModuleRoot then. Finding the root of the script executing is a common action and it was nice to include this variable but why not for any executing powershell so I am left to keep using $MyInvocation.$MyCommand.Path for this purpose. The second little irritant is the fact that if you define params that are of type switch or bool and their value is set to $false (even if you explicitly set their default value) they do not appear in the $PsBounParameters collection. This suck in the case that you want to use that collection as an object initializer i.e. ( New-Object SomeObject –Property $PsBoundParameters ). In this case the bools on the object don't get set to false which is not really an issue unless the Object is PSObject and you are creating the Property Name/Values on the Object then the name and values don't even get created on your PSObject. Not Sure why the decided not to have the values appear in the $PsBoundParameters collection but makes code messier by having to define the complete hashtable with names and values of the switch or bool that is being used to initialize the Object.&#160;&#160; That said Powershell rocks and these can be worked around just seems like odd design choices to me. </p>  
