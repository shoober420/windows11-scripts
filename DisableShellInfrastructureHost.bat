rem # Disable Shell Infrastructure Host

rem # !!! WARNING !!!

rem # Breaks taskbar and causes slow machine

rem # explorer.exe - System Warning: Unknown Hard Error

rem # !!! WARNING !!!

rem # TESTING ONLY

PAUSE

takeown /s %computername% /u %username% /f "C:\Windows\System32\sihost.exe"
icacls "C:\Windows\System32\sihost.exe" /grant:r %username%:F
taskkill /im sihost.exe /f
rem del "C:\Windows\System32\sihost.exe" /s /f /q
ren "C:\Windows\System32\sihost.exe" "sihost.exe.bak"

PAUSE