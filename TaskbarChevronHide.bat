rem # Turn Off Hidden Icon Menu on Taskbar System Tray
reg add "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\TrayNotify" /v "SystemTrayChevronVisibility" /t REG_DWORD /d "0" /f

PAUSE
