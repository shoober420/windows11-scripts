REM Rename Fonts directory
REM Debloat extra fonts

REM Windows 95/98 uses Microsoft Sans Serif
REM Windows XP/7 uses Tahoma
REM Windows 10 uses Segoe UI
REM Windows 11 uses Segoe UI Variable

REM Microsoft Sans Serif Regular (micross.ttf) is the new TrueType version
REM MS Sans Serif Regular is the old .FON bitmap version

REM GUI font required or will black screen at login

REM If font folder is deleted, boot into WinRE and open cmd prompt
REM copy C:\Windows.old\Fonts C:\Windows\Fonts
REM if Windows.old is not found, copy X:\Windows\Fonts C:\Windows\Fonts (uses same font scheme as WinRE shell such as italic desktop icons) (missing lots of fonts like Arial)


REM rmdir /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\Fonts"

REM copy "%WINDIR%\Fonts\micross.ttf" "%USERPROFILE%\Downloads"
REM copy "%WINDIR%\Fonts\arial.ttf" "%USERPROFILE%\Downloads"

REM Manual removal of fonts needed
REM Deleting fonts breaks games like CS1.6, find out what fonts games use
REM takeown /s %computername% /u %username% /f "%WINDIR%\Fonts"
REM icacls "%WINDIR%\Fonts" /grant:r %username%:F
REM ren "%WINDIR%\Fonts" "Fonts.bak"
REM rmdir /s /q "%WINDIR%\Fonts"
REM copy "%USERPROFILE%\Downloads\micross.ttf" "%WINDIR%\Fonts"
REM copy "%USERPROFILE%\Downloads\arial.ttf" "%WINDIR%\Fonts"

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI (TrueType)" /t REG_SZ /d "" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Black (TrueType)" /t REG_SZ /d "" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Black Italic (TrueType)" /t REG_SZ /d "" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Emoji (TrueType)" /t REG_SZ /d "" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Historic (TrueType)" /t REG_SZ /d "" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Light Italic (TrueType)" /t REG_SZ /d "" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Semibold Italic (TrueType)" /t REG_SZ /d "" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Semilight (TrueType)" /t REG_SZ /d "" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Semilight Italic (TrueType)" /t REG_SZ /d "" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Bold (TrueType)" /t REG_SZ /d "" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Bold Italic (TrueType)" /t REG_SZ /d "" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Italic (TrueType)" /t REG_SZ /d "" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Light (TrueType)" /t REG_SZ /d "" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Semibold (TrueType)" /t REG_SZ /d "" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Symbol (TrueType)" /t REG_SZ /d "" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Fonts" /v "Segoe UI Variable (TrueType)" /t REG_SZ /d "" /f

REM .FON fonts are not supported (MS Sans Serif Regular)
reg delete "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes" /v "Segoe UI" /t REG_SZ /d "IBM Plex Mono" /f

PAUSE
