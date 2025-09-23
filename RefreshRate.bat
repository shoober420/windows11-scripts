rem # Force Refresh Rate in game

@echo off

echo.
echo Refresh Rate
echo.
echo 1. 60Hz
echo 2. 75Hz
echo 3. 100Hz
echo 4. 120Hz
echo 5. 144Hz
echo 6. 240Hz
echo 7. 360Hz
echo 8. 500Hz
echo 9. 1000Hz
echo C. Cancel
echo.
choice /c 123456789C /m "Choose an option :"

if 9 EQU %ERRORLEVEL% (
   call :1000
) else if 8 EQU %ERRORLEVEL% (
   call :500
) else if 7 EQU %ERRORLEVEL% (
   call :360
) else if 6 EQU %ERRORLEVEL% (
   call :240
) else if 5 EQU %ERRORLEVEL% (
   call :144
) else if 4 EQU %ERRORLEVEL% (
   call :120
) else if 3 EQU %ERRORLEVEL% (
   call :100
) else if 2 EQU %ERRORLEVEL% (
   call :75
) else if 1 EQU %ERRORLEVEL% (
   call :60
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:60
echo User chose 60Hz

reg add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "ForceRefreshRate" /t REG_DWORD /d "60" /f
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectDraw" /v "ForceRefreshRate" /t REG_DWORD /d "60" /f

reg add "HKCU\Control Panel\Desktop" /v "PreferredRefreshRate" /t REG_SZ /d "60" /f


goto :end

:75
echo User chose 75Hz

reg add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "ForceRefreshRate" /t REG_DWORD /d "75" /f
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectDraw" /v "ForceRefreshRate" /t REG_DWORD /d "75" /f

reg add "HKCU\Control Panel\Desktop" /v "PreferredRefreshRate" /t REG_SZ /d "75" /f

goto :end

:100
echo User chose 100Hz

reg add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "ForceRefreshRate" /t REG_DWORD /d "100" /f
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectDraw" /v "ForceRefreshRate" /t REG_DWORD /d "100" /f

reg add "HKCU\Control Panel\Desktop" /v "PreferredRefreshRate" /t REG_SZ /d "100" /f

goto :end

:120
echo User chose 120Hz

reg add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "ForceRefreshRate" /t REG_DWORD /d "120" /f
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectDraw" /v "ForceRefreshRate" /t REG_DWORD /d "120" /f

reg add "HKCU\Control Panel\Desktop" /v "PreferredRefreshRate" /t REG_SZ /d "120" /f

goto :end

:144
echo User chose 144Hz

reg add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "ForceRefreshRate" /t REG_DWORD /d "144" /f
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectDraw" /v "ForceRefreshRate" /t REG_DWORD /d "144" /f

reg add "HKCU\Control Panel\Desktop" /v "PreferredRefreshRate" /t REG_SZ /d "144" /f

goto :end

:240
echo User chose 240Hz

reg add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "ForceRefreshRate" /t REG_DWORD /d "240" /f
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectDraw" /v "ForceRefreshRate" /t REG_DWORD /d "240" /f

reg add "HKCU\Control Panel\Desktop" /v "PreferredRefreshRate" /t REG_SZ /d "240" /f

goto :end

:360
echo User chose 360Hz

reg add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "ForceRefreshRate" /t REG_DWORD /d "360" /f
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectDraw" /v "ForceRefreshRate" /t REG_DWORD /d "360" /f

reg add "HKCU\Control Panel\Desktop" /v "PreferredRefreshRate" /t REG_SZ /d "360" /f

goto :end

:500
echo User chose 500Hz

reg add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "ForceRefreshRate" /t REG_DWORD /d "500" /f
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectDraw" /v "ForceRefreshRate" /t REG_DWORD /d "500" /f

reg add "HKCU\Control Panel\Desktop" /v "PreferredRefreshRate" /t REG_SZ /d "500" /f

goto :end

:1000
echo User chose 1000Hz

reg add "HKLM\SOFTWARE\Microsoft\DirectDraw" /v "ForceRefreshRate" /t REG_DWORD /d "1000" /f
reg add "HKLM\SOFTWARE\WOW6432Node\Microsoft\DirectDraw" /v "ForceRefreshRate" /t REG_DWORD /d "1000" /f

reg add "HKCU\Control Panel\Desktop" /v "PreferredRefreshRate" /t REG_SZ /d "1000" /f

goto :end

:end

PAUSE

rem # Updates monitor refresh rate
rem # Requires Refresh Rate Switcher (https://github.com/sryze/RefreshRateSwitcher)

rem # Tweak last setting to desired value before launching
rem # RefreshRateSwitcher.exe 0 360

rem # !!!WARNING!!!

rem # Black screen may occur if unsupported refresh rate is chosen

rem # !!!WARNING!!!

rem PAUSE

rem %USERPROFILE%\Downloads\RefreshRateSwitcher-0.1.1-win64\RefreshRateSwitcher.exe 0 240

rem TIMEOUT /T 5
