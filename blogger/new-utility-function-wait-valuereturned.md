+++
title = "New Utility Function Wait-ValueReturned"
date = 2014-06-23T08:02:00Z
updated = 2014-06-23T08:02:26Z
blogimport = true 
[author]
	name = "Paul Cassidy"
	uri = "https://plus.google.com/112112394037667071918"
+++

I Just need a way to block a scripts execution while I wait on some command to return the correct value. So I created this little function to allow me to pass the command or commands and what i expect back and let it handle the work instead of littering my scripts main body with a bunch of loops, if / else, and sleeps, I can use this to encapsulate all that into a clean function.<br><script src="https://gist.github.com/qawarrior/01c58bbcec77b3465b2c.js"></script>
