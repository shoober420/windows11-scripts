rem # Windows 98 Teal Green Solid Color Background

rem # !!! WARNING !!!

rem # DELETES CURRENT WALLPAPER FOR SOLID COLOR BACKGROUND

rem # !!! WARNING !!!

rem # Restart explorer, re-sign in, or reboot required

PAUSE

rem # BackgroundType: 0 = Picture / 1 = Solid color / 2 = Slideshow
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers" /v "BackgroundType" /t REG_DWORD /d "1" /f

rem # 10 = Fill (default) / 4,5,1,0 = Center / 2 = Stretch / 6 = Fit
reg add "HKCU\Control Panel\Desktop" /v "WallpaperStyle" /t REG_SZ /d "0" /f

rem # 0 = Center / 1 = Tile / 2 = Stretch / 3 = Fit / 4 = Fill / 5 = Span
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "WallpaperStyle" /t REG_SZ /d "0" /f

reg add "HKCU\Control Panel\Desktop" /v "TileWallpaper" /t REG_SZ /d "0" /f

rem # Compress Wallpaper
reg add "HKCU\Control Panel\Desktop" /v "JPEGImportQuality" /t REG_DWORD /d "1" /f

reg add "HKCU\Control Panel\Desktop" /v "WallpaperOriginX" /t REG_DWORD /d "0" /f
reg add "HKCU\Control Panel\Desktop" /v "WallpaperOriginY" /t REG_DWORD /d "0" /f

rem reg add "HKCU\Control Panel\Desktop" /v "Wallpaper" /t REG_SZ /d "%USERPROFILE%\Downloads\wallpaper.jpg" /f
rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "Wallpaper" /t REG_SZ /d "%USERPROFILE%\Downloads\wallpaper.jpg" /f

reg delete "HKCU\Control Panel\Desktop" /v "Wallpaper" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System" /v "Wallpaper" /f

reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers" /v "BackgroundHistoryPath0" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers" /v "BackgroundHistoryPath1" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers" /v "BackgroundHistoryPath2" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers" /v "BackgroundHistoryPath3" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers" /v "BackgroundHistoryPath4" /f



@echo off
@echo off

echo.
echo Background Color
echo.
echo 1. Win95/98 Teal Green
echo 2. Win95/98 Navy Blue
echo 3. Win95/98 Blue
echo 4. Win2000/XP Light Blue
echo 5. Win11 Blue
echo 6. Win11 Black (default)
echo C. Cancel
echo.
choice /c 123456C /m "Choose an option :"

if 7 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 6 EQU %ERRORLEVEL% (
   call :black
) else if 5 EQU %ERRORLEVEL% (
   call :blue
) else if 4 EQU %ERRORLEVEL% (
   call :lblue
) else if 3 EQU %ERRORLEVEL% (
   call :win95
) else if 2 EQU %ERRORLEVEL% (
   call :navy
) else if 1 EQU %ERRORLEVEL% (
   call :teal
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:teal
echo User chose Win95/98 Teal Green
rem # Windows 95/98 Teal Green
rem # HEX: #008080
rem # RGB: (0 128 128)
reg add "HKCU\Control Panel\Colors" /v "Background" /t REG_SZ /d "0 128 128" /f
reg add "HKCU\Control Panel\Colors" /v "Desktop" /t REG_SZ /d "0 128 128" /d

goto :end

:navy
echo User chose Win95/98 Navy Blue
rem # Windows 95/98 Navy Blue
rem # HEX: #000080
rem # RGB: (0 0 128)
reg add "HKCU\Control Panel\Colors" /v "Background" /t REG_SZ /d "0 0 128" /f
reg add "HKCU\Control Panel\Colors" /v "Desktop" /t REG_SZ /d "0 0 128" /f

goto :end

:win95
echo User chose Win95/98 Blue
rem # Windows 95/98 Blue
rem # HEX: #0000FF
rem # RGB: (0 0 255)
reg add "HKCU\Control Panel\Colors" /v "Background" /t REG_SZ /d "0 0 255" /f
reg add "HKCU\Control Panel\Colors" /v "Desktop" /t REG_SZ /d "0 0 255" /f

goto :end

:lblue
echo User chose Win2000/XP Light Blue
rem # Windows 2000/XP Light Blue
rem # HEX: #3A6EA5
rem # RGB: (58 110 165)
reg add "HKCU\Control Panel\Colors" /v "Background" /t REG_SZ /d "58 110 165" /f
reg add "HKCU\Control Panel\Colors" /v "Desktop" /t REG_SZ /d "58 110 165" /f

goto :end

:blue
echo User chose Win11 Blue
rem # Win11 Blue
rem # HEX: #0078D7
rem # RGB: (0 120 215)
reg add "HKCU\Control Panel\Colors" /v "Background" /t REG_SZ /d "0 120 215" /f
reg add "HKCU\Control Panel\Colors" /v "Desktop" /t REG_SZ /d "0 120 215" /f

goto :end

:black
echo User chose Win11 Black (default)
rem # Black (default)
rem # HEX: #000000
rem # RGB: (0 0 0)
reg add "HKCU\Control Panel\Colors" /v "Background" /t REG_SZ /d "0 0 0" /f
reg add "HKCU\Control Panel\Colors" /v "Desktop" /t REG_SZ /d "0 0 0" /f

goto :end

:end

PAUSE