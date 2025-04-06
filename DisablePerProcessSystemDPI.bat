rem # Disable Per-Process System DPI

reg add "HKCU\Software\Policies\Microsoft\Windows\Control Panel\Desktop" /v "EnablePerProcessSystemDPI" /t REG_DWORD /d "0" /f

PAUSE