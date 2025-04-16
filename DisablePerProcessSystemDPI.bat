rem # Disable Per-Process System DPI
rem # Force 96 DPI

rem # 96 DPI required for mouse accel fix

reg add "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v "EnablePerProcessSystemDPI" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop" /v "EnablePerProcessSystemDPI" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Policies\Microsoft\Windows\Display" /v "EnablePerProcessSystemDPIForProcesses" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Display" /v "EnablePerProcessSystemDPIForProcesses" /t REG_DWORD /d "0" /f

rem # Disable DPI Scaling
rem # https://thegeekpage.com/disable-display-scaling-on-high-dpi-settings/
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion" /v "PreferExternalManifest" /t REG_DWORD /d "1" /f

rem # Win8DpiScaling when set to 1 is used in conjunction with LogPixels to adjust scaling factor
rem # 0x60 = 100% Scaling (default) (96DPI)
reg add "HKCU\Control Panel\Desktop" /v "Win8DpiScaling" /t REG_DWORD /d "0" /f

reg delete "HKCU\Control Panel\Desktop" /v "LogPixels" /f
rem reg add "HKCU\Control Panel\Desktop" /v "LogPixels" /t REG_DWORD /d "0x60" /f

rem # Remove DPI Scaling Reg Keys
reg delete "HKCU\Control Panel\Desktop\WindowMetrics" /v "AppliedDPI" /f
rem reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "AppliedDPI" /t REG_DWORD /d "0x60" /f

reg delete "HKCU\Control Panel\Desktop" /v "DpiScalingVer" /f
rem reg add "HKCU\Control Panel\Desktop" /v "DpiScalingVer" /t REG_DWORD /d "0x1000" /f

PAUSE