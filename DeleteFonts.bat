REM Rename Fonts directory
REM Debloat extra fonts
REM Windows 11 requires Segoe UI Variable or will black screen at login

rmdir /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\Fonts"

takeown /s %computername% /u %username% /f "C:\Windows\Fonts"
icacls "C:\Windows\Fonts" /grant:r %username%:F
rename "C:\Windows\Fonts" "Fonts.bak"
REM rmdir /s /q "C:\Windows\Fonts"

PAUSE
