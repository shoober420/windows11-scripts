rem # Remove Activate Windows watermark on the bottom right of the screen

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform\Activation" /v "Manual" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform\Activation" /v "ActivationInterval" /t REG_DWORD /d "0" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform\Activation" /v "NotificationDisabled" /t REG_DWORD /d "0" /f

reg add "HKCU\Control Panel\Desktop" /v "PaintDesktopVersion" /t REG_DWORD /d "0" /f

PAUSE