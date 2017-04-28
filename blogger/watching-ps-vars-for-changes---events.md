+++
title = "Watching PS Vars for changes - Events"
date = 2011-02-15T13:47:00Z
updated = 2014-05-22T18:54:57Z
tags = ["Eventing", "Powershell"]
blogimport = true 
[author]
	name = "Paul Cassidy"
	uri = "https://plus.google.com/112112394037667071918"
+++

<p>I have a Testing framework built around Powershell and .net. In the framework there are a couple of main objects that their property values are assigned to Globals that are well know and used. The problem was I did not want to make them read only as this causes issues if reloading the framework and or trying to change paths. I needed a way to report back the value of a variable if it changes so i could keep the objects in sync. First I used Set-PSBreakPoint –Action to Check the value but it breaks before the value is set. Then I thought I need an Event but Powershell has limited native events. So I just started tweeting and thanks to @oising I finally have a solution. Here is a simple example that can be built upon. </p>  <p>&#160;</p>  <pre><span style="color: #008000">#Set value to a new variable<br /></span><span style="color: #800080">$n</span><span style="color: #000000"> </span><span style="color: #ff0000">=</span><span style="color: #000000"> </span><span style="color: #000000">0</span><span style="color: #000000"><br /><br /></span><span style="color: #008000">#set A break point to watch for any write actions to that variable<br />#this will fire a new event VariableChanged<br /></span><span style="color: #800080">$BP</span><span style="color: #000000"> </span><span style="color: #ff0000">=</span><span style="color: #000000"> </span><span style="color: #5f9ea0">Set-PSBreakpoint</span><span style="color: #000000"> </span><span style="color: #5f9ea0">-Variable</span><span style="color: #000000"> </span><span style="color: #0000ff">n</span><span style="color: #000000"> </span><span style="color: #5f9ea0">-Mode</span><span style="color: #000000"> </span><span style="color: #0000ff">Write</span><span style="color: #000000"> </span><span style="color: #5f9ea0">-Action</span><span style="color: #000000"> {<br />    </span><span style="color: #5f9ea0">New-Event</span><span style="color: #000000"> </span><span style="color: #5f9ea0">-SourceIdentifier</span><span style="color: #000000"> </span><span style="color: #0000ff">VariableChanged</span><span style="color: #000000"><br /></span><span style="color: #000000">}<br /><br /></span><span style="color: #008000">#Now register to recieve the VariableChanged events<br />#Here we just check the value of our variable and get its new value<br /></span><span style="color: #800080">$EE</span><span style="color: #000000"> </span><span style="color: #ff0000">=</span><span style="color: #000000"> </span><span style="color: #5f9ea0">Register-EngineEvent</span><span style="color: #000000"> </span><span style="color: #5f9ea0">-SourceIdentifier</span><span style="color: #000000"> </span><span style="color: #0000ff">VariableChanged</span><span style="color: #000000"> </span><span style="color: #5f9ea0">-Action</span><span style="color: #000000"> {<br />    </span><span style="color: #5f9ea0">Write-Host</span><span style="color: #000000"> </span><span style="color: #800080">$n</span><span style="color: #000000"> </span><span style="color: #5f9ea0">-ForegroundColor</span><span style="color: #000000"> </span><span style="color: #0000ff">Yellow</span><span style="color: #000000"><br />}<br /><br /></span><span style="color: #008000">#assign a new value to n and see the vent fires<br /></span><span style="color: #800080">$n</span><span style="color: #000000"> </span><span style="color: #ff0000">=</span><span style="color: #000000"> </span><span style="color: #000000">1</span><span style="color: #000000"><br /><br /></span><span style="color: #008000">#do some cleanup<br /></span><span style="color: #5f9ea0">Get-PSBreakpoint</span><span style="color: #000000"> </span><span style="color: #0000ff">|</span><span style="color: #000000"> </span><span style="color: #5f9ea0">Remove-PSBreakpoint</span><span style="color: #000000"><br /></span><span style="color: #5f9ea0">Get-EventSubscriber</span><span style="color: #000000"> </span><span style="color: #0000ff">|</span><span style="color: #000000"> </span><span style="color: #5f9ea0">Unregister-Event</span><span style="color: #000000"> </span><span style="color: #5f9ea0">-Force</span><span style="color: #000000"><br /></span><span style="color: #5f9ea0">Get-Event</span><span style="color: #000000"> </span><span style="color: #0000ff">|</span><span style="color: #000000"> </span><span style="color: #5f9ea0">Remove-Event</span></pre><br /><br /><p>&#160;</p><br /><br /><p>Good-Times | Get-Command –:)</p>  