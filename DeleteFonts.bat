REM Rename Fonts directory
REM Debloat extra fonts
REM Windows 95/98 uses Microsoft Sans Serif
REM Windows XP/7 uses Tahoma
REM Windows 10/11 uses Segoe UI Variable
REM GUI font required or will black screen at login

rmdir /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\Fonts"

takeown /s %computername% /u %username% /f "C:\Windows\Fonts"
icacls "C:\Windows\Fonts" /grant:r %username%:F
rename "C:\Windows\Fonts" "Fonts.bak"
REM rmdir /s /q "C:\Windows\Fonts"

PAUSE
