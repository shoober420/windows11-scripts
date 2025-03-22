rem # Windows 98 Teal Green Solid Color Background

rem # !!! WARNING !!!

rem # DELETES CURRENT WALLPAPER FOR SOLID COLOR BACKGROUND

rem # !!! WARNING !!!

PAUSE

rem # BackgroundType: 0 = Picture / 1 = Solid color / 2 = Slideshow
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers" /v BackgroundType /t REG_DWORD /d 1 /f

reg add "HKCU\Control Panel\Desktop" /v "Wallpaper" /t REG_SZ /d "" /f

rem # HEX: #008080
rem # RGB: (0 128 128)
reg add "HKCU\Control Panel\Colors" /v "Background" /t REG_SZ /d "0 128 128" /f

PAUSE