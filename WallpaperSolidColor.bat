rem # Windows 98 Teal Green Solid Color Background

rem # !!! WARNING !!!

rem # DELETES CURRENT WALLPAPER FOR SOLID COLOR BACKGROUND

rem # !!! WARNING !!!

rem # Restart explorer, re-sign in, or reboot required

PAUSE

rem # BackgroundType: 0 = Picture / 1 = Solid color / 2 = Slideshow
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers" /v BackgroundType /t REG_DWORD /d 1 /f

reg add "HKCU\Control Panel\Desktop" /v "Wallpaper" /t REG_SZ /d "" /f



@echo off
@echo off

echo.
echo 1. Win95/98 Teal Green
echo 2. Win95/98 Blue
echo 3. Win2000/XP Light Blue
echo 4. Win11 Black (default)
echo C. Cancel
echo.
choice /c 1234C /m "Choose an option :"

if 5 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 4 EQU %ERRORLEVEL% (
   call :black
) else if 3 EQU %ERRORLEVEL% (
   call :lblue
) else if 2 EQU %ERRORLEVEL% (
   call :blue
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

goto :end

:blue
echo User chose Win95/98 Blue
rem # Windows 95/98 Blue
rem # HEX: #000082
rem # RGB: (0 0 130)
reg add "HKCU\Control Panel\Colors" /v "Background" /t REG_SZ /d "0 0 130" /f

goto :end

:lblue
echo User chose Win2000/XP Light Blue
rem # Windows 2000/XP Light Blue
rem # HEX: #3A6EA5
rem # RGB: (58 110 165)
reg add "HKCU\Control Panel\Colors" /v "Background" /t REG_SZ /d "58 110 165" /f

goto :end

:black
echo User chose Win11 Black (default)
rem # Black (default)
rem # HEX: #000000
rem # RGB: (0 0 0)
reg add "HKCU\Control Panel\Colors" /v "Background" /t REG_SZ /d "0 0 0" /f

goto :end

:end

PAUSE