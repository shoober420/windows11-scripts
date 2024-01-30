REM Delete Fonts
REM Windows 11 requires Segou font family, or will black screen at login

rmdir /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\Fonts"

takeown /s %computername% /u %username% /f "C:\Windows\Fonts"
icacls "C:\Windows\Fonts" /grant:r %username%:F
rename "C:\Windows\Fonts" "Fonts.bak"
REM rmdir /s /q "C:\Windows\Fonts"

PAUSE
