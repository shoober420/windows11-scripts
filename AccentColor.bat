rem # Accent color

rem # Default (Windows 11 Blue / RGB: 0 120 215) = 0xff0078d7 / 0xffd77800
rem # Win2000/WinXP Light Blue (RGB: 58 110 165) = 0xff3a6ea5 / 0xffa56e3a
rem # Navy (Windows 95 Titlebar Blue / RGB: 0 0 95) = 0xff00005f / 0xff7f0000
rem # Teal (RGB: 0 128 128) = 0xff008080 / 0xff808000
rem # Seafoam (RGB: 0 183 195) = 0xff00b6c3 / 0xffc3b700

@echo off

@echo off

echo.
echo 1. Default (Windows 11 Blue)
echo 2. Win2000/WinXP Light Blue
echo 3. Navy (Windows 95 Blue)
echo 4. Teal (Windows 98 Green)
echo 5. Seafoam
echo C. Cancel
echo.
choice /c 1234C /m "Choose an option :"

if 6 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 5 EQU %ERRORLEVEL% (
   call :seafoam
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

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "9aebff0061ccff000093fc000078d700005fba00003f9500001a6a0088179800" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d "0xffd77800" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xffd77800" /f

goto :end

:win2000
echo User chose Win2000/WinXP Light Blue

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "0xffa56e3a" /f

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColor" /t REG_DWORD /d "0xffa56e3a" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "bce7f10099c6dd005a8dbe004577af00365e9400233e72000c194a0088179800" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d "0xffa56e3a" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xffa56e3a" /f

goto :end

:win95
echo User chose Navy (Windows 95 Blue)

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "0xff7f0000" /f

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColor" /t REG_DWORD /d "0xff7f0000" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "0000d6ff0000b2ff000099ff00007fff000066ff00004cff000028ff88179800" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d "0xff7f0000" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xff7f0000" /f

goto :end

:win98
echo User chose Teal (Windows 98 Green)

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "0xff808000" /f

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColor" /t REG_DWORD /d "0xff808000" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "80f9f9003cf6f60008afaf0006828200056a6900034b4a000128260088179800" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d "0xff808000" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xff808000" /f

goto :end

:seafoam
echo User chose Seafoam

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "0xffc3b700" /f

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColor" /t REG_DWORD /d "0xffc3b700" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "69fcff0029f7ff0000d5e10000b7c300009faa000067700000343b004a545900" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d "0xffc3b700" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xffc3b700" /f

goto :end

:end

PAUSE
