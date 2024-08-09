rem # Mateusz Kaflowski
rem # https://superuser.com/questions/1777667/is-there-a-way-to-set-hdr-mode-by-command

rem # WIN + ALT + B also toggles HDR on display

rem # Toggles HDR On or Off when this script is launched

Set oShell = CreateObject("WScript.Shell")
oShell.Run("""ms-settings:display""")
WScript.Sleep 1000

' Loop to send TAB key
For i = 1 To 7
    oShell.SendKeys "{TAB}"
    WScript.Sleep 4
Next

' Send SPACE key and close the window
oShell.SendKeys " "
WScript.Sleep 1000
oShell.SendKeys "%{F4}"
