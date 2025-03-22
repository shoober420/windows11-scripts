rem # Windows 98 Teal Green Solid Color Background

rem # !!! WARNING !!!

rem # DELETES CURRENT WALLPAPER FOR SOLID COLOR BACKGROUND

rem # !!! WARNING !!!

rem # Restart explorer, re-sign in, or reboot required

PAUSE

rem # BackgroundType: 0 = Picture / 1 = Solid color / 2 = Slideshow
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers" /v BackgroundType /t REG_DWORD /d 1 /f

reg add "HKCU\Control Panel\Desktop" /v "Wallpaper" /t REG_SZ /d "" /f

rem # Windows 95/98 Teal Green
rem # HEX: #008080
rem # RGB: (0 128 128)
reg add "HKCU\Control Panel\Colors" /v "Background" /t REG_SZ /d "0 128 128" /f

rem # Windows 2000/XP Light Blue
rem # HEX: #3A6EA5
rem # RGB: (58 110 165)
rem reg add "HKCU\Control Panel\Colors" /v "Background" /t REG_SZ /d "58 110 165" /f

rem # Black (default)
rem # HEX: #000000
rem # RGB: (0 0 0)
rem reg add "HKCU\Control Panel\Colors" /v "Background" /t REG_SZ /d "0 0 0" /f

PAUSE