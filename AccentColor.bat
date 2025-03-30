rem # Accent color

rem # Default (Windows 11 Blue / RGB: 0 120 215) = 0xff0078d7
rem # Win2000/WinXP Light Blue (RGB: 58 110 165) = 0xff446ea5
rem # Navy (Windows 95 Titlebar Blue / RGB: 0 0 95) = 0xff5f0000
rem # Teal (RGB: 0 128 128) = 0xff808000
rem # Seafoam (RGB: 0 183 195) = 0xffc3b700

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "0xff446ea5" /f

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColor" /t REG_DWORD /d "0xff446ea5" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d "0xff446ea5" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xff446ea5" /f

PAUSE