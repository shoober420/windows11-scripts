rem # TCP Auto-Tuning Level script

rem # Normal is the best value (default)

rem # Normal / Disabled / Restricted / Highly Restricted / Experimental

PAUSE

@echo off
@echo off

echo.
echo TCP Auto-Tuning Level
echo.
echo 1. Normal (default)
echo 2. Disabled
echo 3. Restricted
echo 4. Highly Restricted
echo 5. Experimental
echo 6. SKIP
echo C. Cancel
echo.
choice /c 123456C /m "Choose an option :"

if 7 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 6 EQU %ERRORLEVEL% (
   call :skip
) else if 5 EQU %ERRORLEVEL% (
   call :experimental
) else if 4 EQU %ERRORLEVEL% (
   call :hrestricted
) else if 3 EQU %ERRORLEVEL% (
   call :restricted
) else if 2 EQU %ERRORLEVEL% (
   call :disabled
) else if 1 EQU %ERRORLEVEL% (
   call :normal
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:normal
echo User chose Normal (default)

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS" /v "Tcp Autotuning Level" /t REG_SZ /d "normal" /f

netsh int tcp set global autotuninglevel=normal

PowerShell.exe Set-NetTCPSetting -SettingName "*" -AutoTuningLevelLocal normal

goto :end

:disabled
echo User chose Disabled

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS" /v "Tcp Autotuning Level" /t REG_SZ /d "disabled" /f

netsh int tcp set global autotuninglevel=disabled

PowerShell.exe Set-NetTCPSetting -SettingName "*" -AutoTuningLevelLocal disabled

goto :end

:restricted
echo User chose Restricted

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS" /v "Tcp Autotuning Level" /t REG_SZ /d "restricted" /f

netsh int tcp set global autotuninglevel=restricted

PowerShell.exe Set-NetTCPSetting -SettingName "*" -AutoTuningLevelLocal restricted

goto :end

:hrestricted
echo User chose Highly Restricted

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS" /v "Tcp Autotuning Level" /t REG_SZ /d "highlyrestricted" /f

netsh int tcp set global autotuninglevel=highlyrestricted

PowerShell.exe Set-NetTCPSetting -SettingName "*" -AutoTuningLevelLocal highlyrestricted

goto :end

:experimental
echo User chose Experimental

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\QoS" /v "Tcp Autotuning Level" /t REG_SZ /d "experimental" /f

netsh int tcp set global autotuninglevel=experimental

PowerShell.exe Set-NetTCPSetting -SettingName "*" -AutoTuningLevelLocal experimental

goto :end

:end

PAUSE


