rem # Windows Solid Color Backgrounds

rem # !!! WARNING !!!

rem # REPLACES CURRENT WALLPAPER FOR SOLID COLOR BACKGROUND

rem # !!! WARNING !!!

rem # HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors controls CTRL+ALT+DEL theme colors

rem # HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast and HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard reg paths (empty directory) needed to fix CTRL+ALT+DEL bug that reverts theme when pressed

rem # Win10 Blue (RGB: 53 126 199 / BGR: 199 126 53) = 0xff357ec7 / 0xffc77e35
rem # Win2000/WinXP Blue (RGB: 58 110 165 / BGR: 165 110 58) = 0xff3a6ea5 / 0xffa56e3a
rem # Win95 Blue (RGB: 0 0 255 / BGR: 255 0 0) = 0xff0000ff / 0xffff0000
rem # Win95 Navy (RGB: 0 0 128 / BGR: 128 0 0) = 0xff000080 / 0xff800000
rem # Win95/98 Teal (RGB: 0 128 128 / BGR: 128 128 0) = 0xff008080 / 0xff808000
rem # Seafoam (RGB: 0 183 195 / BGR: 195 183 00) = 0xff00b6c3 / 0xffc3b600
rem # Win95/98 Gray (RGB: 128 128 128 / BGR: 128 128 128) = 0xff808080 / 0xff808080
rem # Win95/98 Silver (RGB: 192 192 192 / BGR: 192 192 192) = 0xffc0c0c0 / 0xffc0c0c0
rem # Win11 Black Dark Theme (RGB: 18 18 18 / BGR: 18 18 18) = 0xff121212 / 0xff121212
rem # Win11 White Smoke Light Theme (RGB: 242 242 242 / BGR: 242 242 242) = 0xfff2f2f2 / 0xfff2f2f2
rem # White (RGB: 255 255 255 / BGR: 255 255 255) = 0x00ffffff / 0x00ffffff
rem # Black (RGB: 0 0 0 / BGR: 0 0 0) = 0x00000000 / 0x00000000
rem # Win95 BSoD (RGB: 0 0 168 / BGR: 168 0 0) = 0xff0000a8 / 0xffa80000
rem # Microsoft Blue (RGB: 0 162 237 / BGR: 237 162 0) = 0xff00a2ed / 0xffeda200

rem # Restart explorer, re-sign in, or reboot required

PAUSE

rem # Launch SetACL.bat to take ownership of reg keys
cd "%~dp0"
ECHO R | powershell.exe ./SetACL.bat
cd "%USERPROFILE%\Downloads"

cd "%USERPROFILE%\Downloads\windows11-scripts-main"
ECHO R | powershell.exe ./SetACL.bat
cd "%USERPROFILE%\Downloads"

cd "%USERPROFILE%\Downloads\windows11-scripts-main\windows11-scripts-main"
ECHO R | powershell.exe ./SetACL.bat
cd "%USERPROFILE%\Downloads"

cd "%USERPROFILE%\Downloads\windows11-scripts\windows11-scripts"
ECHO R | powershell.exe ./SetACL.bat
cd "%USERPROFILE%\Downloads"

cd "%USERPROFILE%\Downloads\windows11-scripts"
ECHO R | powershell.exe ./SetACL.bat
cd "%USERPROFILE%\Downloads"

TIMEOUT /T 5

rem # Background Type
rem # 0 = Picture / 1 = Solid Color / 2 = Slideshow / 3 = Windows Spotlight
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers" /v "BackgroundType" /t REG_DWORD /d "1" /f

reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Themes\Wallpaper" /v "WallpaperSurfaceProvidedToDwm" /t REG_DWORD /d "0" /f

rem # Disable Wallpaper changes
rem # Fixes wallpaper switching to default when pressing CTRL+ALT+DEL in high contrast mode
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop" /v "NoChangingWallPaper" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\Policies\ActiveDesktop" /v "NoChangingWallPaper" /t REG_DWORD /d "1" /f

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
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers" /v "BackedUpWallpaperPath" /f



@echo off
@echo off

echo.
echo Background Color
echo.
echo 1. Win95/98 Teal
echo 2. Win95 Navy
echo 3. Win95 Dark Blue (BSoD) (VGA Blue)
echo 4. Win95 Blue
echo 5. Win2000/XP Blue
echo 6. Win10 Blue (Windows Blue)
echo 7. Microsoft Blue
echo 8. Black
echo C. Cancel
echo.
choice /c 12345678C /m "Choose an option :"

if 9 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 8 EQU %ERRORLEVEL% (
   call :black
) else if 7 EQU %ERRORLEVEL% (
   call :microb
) else if 6 EQU %ERRORLEVEL% (
   call :w10blue
) else if 5 EQU %ERRORLEVEL% (
   call :w2000blue
) else if 4 EQU %ERRORLEVEL% (
   call :win95blue
) else if 3 EQU %ERRORLEVEL% (
   call :bsod
) else if 2 EQU %ERRORLEVEL% (
   call :win95navy
) else if 1 EQU %ERRORLEVEL% (
   call :win95teal
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:win95teal
echo User chose Win95/98 Teal
rem # Windows 95/98 Teal
rem # HEX: #008080
rem # RGB: (0 128 128)
reg add "HKCU\Control Panel\Colors" /v "Background" /t REG_SZ /d "0 128 128" /f
reg add "HKCU\Control Panel\Colors" /v "Desktop" /t REG_SZ /d "0 128 128" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Personalization" /v "PersonalColors_Background" /t REG_SZ /d "#008080" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "Background" /t REG_SZ /d "0 128 128" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Background" /t REG_DWORD /d "0x00808000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Background" /t REG_DWORD /d "0x00808000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Desktop" /t REG_DWORD /d "0x00808000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Desktop" /t REG_DWORD /d "0x00808000" /f

goto :end

:win95navy
echo User chose Win95 Navy
rem # Windows 95 Navy
rem # HEX: #000080
rem # RGB: (0 0 128)
reg add "HKCU\Control Panel\Colors" /v "Background" /t REG_SZ /d "0 0 128" /f
reg add "HKCU\Control Panel\Colors" /v "Desktop" /t REG_SZ /d "0 0 128" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Personalization" /v "PersonalColors_Background" /t REG_SZ /d "#000080" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "Background" /t REG_SZ /d "0 0 128" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Background" /t REG_DWORD /d "0x00800000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Background" /t REG_DWORD /d "0x00800000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Desktop" /t REG_DWORD /d "0x00800000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Desktop" /t REG_DWORD /d "0x00800000" /f

goto :end

:bsod
echo User chose Win95 Dark Blue (BSoD) (VGA Blue)
rem # Windows 95 Dark Blue (Blue Screen of Death) (VGA Blue)
rem # HEX: #0000A8
rem # RGB: (0 0 168)
reg add "HKCU\Control Panel\Colors" /v "Background" /t REG_SZ /d "0 0 168" /f
reg add "HKCU\Control Panel\Colors" /v "Desktop" /t REG_SZ /d "0 0 168" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Personalization" /v "PersonalColors_Background" /t REG_SZ /d "#0000A8" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "Background" /t REG_SZ /d "0 0 168" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Background" /t REG_DWORD /d "0x00a80000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Background" /t REG_DWORD /d "0x00a80000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Desktop" /t REG_DWORD /d "0x00a80000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Desktop" /t REG_DWORD /d "0x00a80000" /f

goto :end

:win95blue
echo User chose Win95 Blue
rem # Windows 95 Blue
rem # HEX: #0000FF
rem # RGB: (0 0 255)
reg add "HKCU\Control Panel\Colors" /v "Background" /t REG_SZ /d "0 0 255" /f
reg add "HKCU\Control Panel\Colors" /v "Desktop" /t REG_SZ /d "0 0 255" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Personalization" /v "PersonalColors_Background" /t REG_SZ /d "#0000FF" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "Background" /t REG_SZ /d "0 0 255" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Background" /t REG_DWORD /d "0x00ff0000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Background" /t REG_DWORD /d "0x00ff0000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Desktop" /t REG_DWORD /d "0x00ff0000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Desktop" /t REG_DWORD /d "0x00ff0000" /f

goto :end

:w2000blue
echo User chose Win2000/XP Blue
rem # Windows 2000/XP Blue
rem # HEX: #3A6EA5
rem # RGB: (58 110 165)
reg add "HKCU\Control Panel\Colors" /v "Background" /t REG_SZ /d "58 110 165" /f
reg add "HKCU\Control Panel\Colors" /v "Desktop" /t REG_SZ /d "58 110 165" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Personalization" /v "PersonalColors_Background" /t REG_SZ /d "#3A6EA5" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "Background" /t REG_SZ /d "58 110 165" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Background" /t REG_DWORD /d "0x00a56e3a" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Background" /t REG_DWORD /d "0x00a56e3a" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Desktop" /t REG_DWORD /d "0x00a56e3a" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Desktop" /t REG_DWORD /d "0x00a56e3a" /f

goto :end

:w10blue
echo User chose Win10 Blue (Windows Blue)
rem # Windows 10 (Windows Blue)
rem # HEX: #357EC7
rem # RGB: (53 126 199)
reg add "HKCU\Control Panel\Colors" /v "Background" /t REG_SZ /d "53 126 199" /f
reg add "HKCU\Control Panel\Colors" /v "Desktop" /t REG_SZ /d "53 126 199" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Personalization" /v "PersonalColors_Background" /t REG_SZ /d "#357EC7" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "Background" /t REG_SZ /d "53 126 199" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Background" /t REG_DWORD /d "0x00c77e35" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Background" /t REG_DWORD /d "0x00c77e35" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Desktop" /t REG_DWORD /d "0x00c77e35" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Desktop" /t REG_DWORD /d "0x00c77e35" /f

goto :end

:microb
echo User chose Microsoft Blue
rem # Microsoft Blue
rem # HEX: #00A2ED
rem # RGB: (0 162 237)
reg add "HKCU\Control Panel\Colors" /v "Background" /t REG_SZ /d "0 162 237" /f
reg add "HKCU\Control Panel\Colors" /v "Desktop" /t REG_SZ /d "0 162 237" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Personalization" /v "PersonalColors_Background" /t REG_SZ /d "#00A2ED" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "Background" /t REG_SZ /d "0 162 237" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Background" /t REG_DWORD /d "0x00eda200" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Background" /t REG_DWORD /d "0x00eda200" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Desktop" /t REG_DWORD /d "0x00eda200" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Desktop" /t REG_DWORD /d "0x00eda200" /f

goto :end

:black
echo User chose Black
rem # Black
rem # HEX: #000000
rem # RGB: (0 0 0)
reg add "HKCU\Control Panel\Colors" /v "Background" /t REG_SZ /d "0 0 0" /f
reg add "HKCU\Control Panel\Colors" /v "Desktop" /t REG_SZ /d "0 0 0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Personalization" /v "PersonalColors_Background" /t REG_SZ /d "#000000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" /v "Background" /t REG_SZ /d "0 0 0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Background" /t REG_DWORD /d "0x00000000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Background" /t REG_DWORD /d "0x00000000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Desktop" /t REG_DWORD /d "0x00000000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Desktop" /t REG_DWORD /d "0x00000000" /f

goto :end

:end

PAUSE