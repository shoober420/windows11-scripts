rem # Disable Windows watermark and version at the bottom right of the screen

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows" /v "DisplayVersion" /t REG_DWORD /d "0" /f

PAUSE