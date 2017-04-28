+++
title = "Wait-Object Function Takes Place of Wait-ValueReturned"
date = 2014-07-14T10:42:00Z
updated = 2014-07-14T10:42:06Z
blogimport = true 
[author]
	name = "Paul Cassidy"
	uri = "https://plus.google.com/112112394037667071918"
+++

I previously posted a function Wait-ValueReturned but is did not seem like it flowed with the rest of PowerShell so I re factored the code into Wait-Object but I am not sure about how the command should return. I have considered first return bool from the command to indicate success, which means the command will always return true or false. My other option is to return to object that was being waited on if success and return error record on fail. here is examples of both. Which makes more sense to use in a script<br /><div><br /></div><div>&nbsp;Returning Bool: <script src="https://gist.github.com/qawarrior/b9acc089f0b04d1a126b.js"></script></div><div><br /></div><div>&nbsp;Returning object or error: <script src="https://gist.github.com/qawarrior/b9acc089f0b04d1a126b.js"></script></div>
