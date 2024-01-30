REM Delete Fonts
rmdir /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\Fonts"

takeown /s %computername% /u %username% /f "C:\Windows\Fonts"
icacls "C:\Windows\Fonts" /grant:r %username%:F
rmdir /s /q "C:\Windows\Fonts"

PAUSE
