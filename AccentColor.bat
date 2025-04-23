rem # Accent color

rem # Default (Windows 11 Blue / RGB: 0 120 215) = 0xff0078d7 / 0xffd77800
rem # Win2000/WinXP Light Blue (RGB: 58 110 165) = 0xff3a6ea5 / 0xffa56e3a
rem # Navy (Win95 Titlebar Blue / RGB: 0 0 95) = 0xff00005f / 0xff7f0000
rem # Teal (RGB: 0 128 128) = 0xff008080 / 0xff808000
rem # Seafoam (RGB: 0 183 195) = 0xff00b6c3 / 0xffc3b700
rem # Win95/98 Grey (RGB: 128 128 128) = 0xff808080
rem # Win95/98 Light Grey Start Menu (RGB: 195 195 195) = 0xffc3c3c3

rem # Show accent color on Start and Taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorPrevalence" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorPrevalence" /t REG_DWORD /d "1" /f

rem # Show accent color on title bars and window borders
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableWindowColorization" /t REG_DWORD /d "1" /f

rem # Windows 95 Grey Inactive Title Bar
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColorInactive" /t REG_DWORD /d "0xff808080" /f

@echo off

@echo off

echo.
echo Accent Color
echo.
echo 1. Default (Windows 11 Blue)
echo 2. Windows2000/XP Light Blue
echo 3. Navy (Windows 95 Blue)
echo 4. Teal (Windows 98 Green)
echo 5. Grey (Windows 95/98)
echo 6. Light Grey (Windows 95/98 Start Menu)
echo 7. Seafoam
echo C. Cancel
echo.
choice /c 1234567C /m "Choose an option :"

if 8 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 7 EQU %ERRORLEVEL% (
   call :seafoam
) else if 6 EQU %ERRORLEVEL% (
   call :lgrey
) else if 5 EQU %ERRORLEVEL% (
   call :grey
) else if 4 EQU %ERRORLEVEL% (
   call :win98
) else if 3 EQU %ERRORLEVEL% (
   call :win95
) else if 2 EQU %ERRORLEVEL% (
   call :win2000
) else if 1 EQU %ERRORLEVEL% (
   call :win11
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:win11
echo User chose Default (Windows 11 Blue)

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "0xffd77800" /f

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColor" /t REG_DWORD /d "0xffd77800" /f

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationColor" /t REG_DWORD /d "0xc4d77800" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "9aebff0061ccff000093fc000078d700005fba00003f9500001a6a0088179800" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xffd77800" /f

goto :end

:win2000
echo User chose Win2000/WinXP Light Blue

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "0xffa56e3a" /f

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColor" /t REG_DWORD /d "0xffa56e3a" /f

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationColor" /t REG_DWORD /d "0xc4a56e3a" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "bce7f10099c6dd005a8dbe004577af00365e9400233e72000c194a0088179800" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xffa56e3a" /f

goto :end

:win95
echo User chose Navy (Windows 95 Blue)

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "0xff7f0000" /f

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColor" /t REG_DWORD /d "0xff7f0000" /f

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationColor" /t REG_DWORD /d "0xc47f0000" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "0000d6ff0000b2ff000099ff00007fff000066ff00004cff000028ff88179800" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xff7f0000" /f

goto :end

:win98
echo User chose Teal (Windows 98 Green)

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "0xff808000" /f

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColor" /t REG_DWORD /d "0xff808000" /f

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationColor" /t REG_DWORD /d "0xc4808000" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "80f9f9003cf6f60008afaf0006828200056a6900034b4a000128260088179800" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xff808000" /f

goto :end

:seafoam
echo User chose Seafoam

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "0xffc3b700" /f

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColor" /t REG_DWORD /d "0xffc3b700" /f

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationColor" /t REG_DWORD /d "0xc4c3b700" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "69fcff0029f7ff0000d5e10000b7c300009faa000067700000343b004a545900" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xffc3b700" /f

goto :end

:grey
echo User chose Grey (Windows 95/98)

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "0xff808080" /f

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColor" /t REG_DWORD /d "0xff808080" /f

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationColor" /t REG_DWORD /d "0xc4808080" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "808080ff808080ff808080ff808080ff7f7f7fff7f7f7fff7f7f7fff88179800" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xff808080" /f

goto :end

:lgrey
echo User chose Light Grey (Windows 95/98 Start Menu)

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "0xffc3c3c3" /f

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColor" /t REG_DWORD /d "0xffc3c3c3" /f

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationColor" /t REG_DWORD /d "0xc4c3c3c3" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "eaeaeaffd8d8d8ffccccccffbfbfbfffb2b2b2ffa5a5a5ff939393ff88179800" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xffc3c3c3" /f

goto :end

:end

echo.
echo Title Bar Color
echo.
echo 1. Windows2000/XP Light Blue
echo 2. Navy (Windows 95 Blue)
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :navy95
) else if 1 EQU %ERRORLEVEL% (
   call :lightb
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:lightb
echo User chose Windows2000/XP Light Blue

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d "0xffa56e3a" /f

goto :end

:navy95
echo User chose Navy (Windows 95 Blue)

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d "0xff7f0000" /f

goto :end

:end

PAUSE
