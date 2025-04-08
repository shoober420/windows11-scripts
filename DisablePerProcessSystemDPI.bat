rem # Disable Per-Process System DPI
rem # Force 96 DPI

rem # 96 DPI required for mouse accel fix

reg add "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v "EnablePerProcessSystemDPI" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Control Panel\Desktop" /v "EnablePerProcessSystemDPI" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Policies\Microsoft\Windows\Display" /v "EnablePerProcessSystemDPIForProcesses" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows\Display" /v "EnablePerProcessSystemDPIForProcesses" /t REG_DWORD /d "0" /f

reg add "HKCU\Control Panel\Desktop" /v "LogPixels" /t REG_DWORD /d "0x60" /f
reg add "HKCU\Control Panel\Desktop" /v "Win8DpiScaling" /t REG_DWORD /d "0" /f
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v "AppliedDPI" /t REG_DWORD /d "0x60" /f

PAUSE