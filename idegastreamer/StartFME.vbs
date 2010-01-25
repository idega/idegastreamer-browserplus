Set WshShell = WScript.CreateObject("WScript.Shell")
WshShell.Run """C:\Program Files\Adobe\Flash Media Live Encoder 3\FlashMediaLiveEncoder.exe""", 9
WScript.Sleep 10000 'milliseconds to wait 
WshShell.AppActivate "Adobe Flash Media Encoder"
WshShell.SendKeys "%fo" 'Open a custom config 
WshShell.SendKeys "streaming.xml"
WshShell.SendKeys "{ENTER}" 'Start encoding 
WshShell.SendKeys "{ENTER}" 'Confirm 