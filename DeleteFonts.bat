REM Rename Fonts directory
REM Debloat extra fonts
REM You must remove all Segoe* fonts manually in the "C:\Windows\Fonts" directory for this batch script to work

REM Windows 95/98 uses Microsoft Sans Serif
REM Windows XP/7 uses Tahoma
REM Windows 10 uses Segoe UI
REM Windows 11 uses Segoe UI Variable

REM Both "%WINDIR%\Fonts" and "%USERPROFILE%\AppData\Local\Microsoft\Windows\Fonts" are linked together

REM Monospaced fonts (IBM Plex Mono) use up too much space in GUI and cut off text, NOT RECOMMENDED

REM Microsoft Sans Serif Regular (micross.ttf) is the new TrueType version
REM MS Sans Serif Regular (ssee1257.fon) is the old bitmap version

REM If font folder is deleted which creates black screen at login, boot into WinRE and open cmd prompt
REM copy C:\Windows.old\Fonts C:\Windows\Fonts
REM if Windows.old is not found, copy X:\Windows\Fonts C:\Windows\Fonts (uses same font scheme as WinRE shell such as italic desktop icons) (missing lots of fonts like Arial)



REM copy "%WINDIR%\Fonts\micross.ttf" "%USERPROFILE%\Downloads"
REM copy "%WINDIR%\Fonts\arial.ttf" "%USERPROFILE%\Downloads"

REM Manual removal of fonts needed
REM Deleting certain fonts breaks games like CS1.6, find out what fonts games use
REM takeown /s %computername% /u %username% /f "%WINDIR%\Fonts"
REM icacls "%WINDIR%\Fonts" /grant:r %username%:F
REM ren "%WINDIR%\Fonts" "Fonts.bak"
REM rmdir /s /q "%WINDIR%\Fonts"
REM rmdir /s /q "%USERPROFILE%\AppData\Local\Microsoft\Windows\Fonts"
REM copy "%USERPROFILE%\Downloads\micross.ttf" "%WINDIR%\Fonts"
REM copy "%USERPROFILE%\Downloads\arial.ttf" "%WINDIR%\Fonts"

del "%WINDIR%\Fonts\8514oemt.fon" /f
del "%WINDIR%\Fonts\YuGothB.ttc" /f
del "%WINDIR%\Fonts\YuGothL.ttc" /f
del "%WINDIR%\Fonts\YuGothM.ttc" /f
del "%WINDIR%\Fonts\YuGothR.ttc" /f
del "%WINDIR%\Fonts\wingding.ttf" /f
del "%WINDIR%\Fonts\webdings.ttf" /f
del "%WINDIR%\Fonts\dos869.fon" /f
del "%WINDIR%\Fonts\8514oemg.fon" /f
del "%WINDIR%\Fonts\sylfaen.ttf" /f
del "%WINDIR%\Fonts\SitkaVF.ttf" /f
del "%WINDIR%\Fonts\SitkaVF-Italic.ttf" /f
del "%WINDIR%\Fonts\simsunb.ttf" /f
del "%WINDIR%\Fonts\simsun.ttc" /f
del "%WINDIR%\Fonts\script.fon" /f
del "%WINDIR%\Fonts\mingliub.ttc" /f
del "%WINDIR%\Fonts\Nirmala.ttc" /f
del "%WINDIR%\Fonts\mmrtext.ttf" /f
del "%WINDIR%\Fonts\mmrtextb.ttf" /f
del "%WINDIR%\Fonts\mvboli.ttf" /f
del "%WINDIR%\Fonts\msyi.ttf" /f
del "%WINDIR%\Fonts\msyh.ttc" /f
del "%WINDIR%\Fonts\msyhbd.ttc" /f
del "%WINDIR%\Fonts\msyhl.ttc" /f
del "%WINDIR%\Fonts\taile.ttf /f
del "%WINDIR%\Fonts\taileb.ttf" /f
del "%WINDIR%\Fonts\phagspa.ttf" /f
del "%WINDIR%\Fonts\phagspab.ttf" /f
del "%WINDIR%\Fonts\ntailu.ttf" /f
del "%WINDIR%\Fonts\ntailub.ttf" /f
del "%WINDIR%\Fonts\msjh.ttc" /f
del "%WINDIR%\Fonts\msjhbd.ttc" /f
del "%WINDIR%\Fonts\msjhl.ttc" /f
del "%WINDIR%\Fonts\himalaya.ttf" /f
del "%WINDIR%\Fonts\malgun.ttf" /f
del "%WINDIR%\Fonts\malgunbd.ttf" /f
del "%WINDIR%\Fonts\malgunsl.ttf" /f
del "%WINDIR%\Fonts\LeelaUIb.ttf" /f
del "%WINDIR%\Fonts\LeelawUI.ttf" /f
del "%WINDIR%\Fonts\LeelUIsl.ttf" /f
del "%WINDIR%\Fonts\javatext.ttf" /f
del "%WINDIR%\Fonts\Inkfree.ttf" /f
del "%WINDIR%\Fonts\impact.ttf" /f
del "%WINDIR%\Fonts\holomdl2.ttf" /f
del "%WINDIR%\Fonts\gadugi.ttf" /f
del "%WINDIR%\Fonts\gadugib.ttf" /f
del "%WINDIR%\Fonts\ebrima.ttf" /f
del "%WINDIR%\Fonts\ebrimabd.ttf" /f

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
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes" /v "Segoe UI" /t REG_SZ /d "Microsoft Sans Serif Regular" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes" /v "Segoe UI Variable" /t REG_SZ /d "Microsoft Sans Serif Regular" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes" /v "Segoe UI Black" /t REG_SZ /d "Microsoft Sans Serif Regular" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes" /v "Segoe UI Black Italic" /t REG_SZ /d "Microsoft Sans Serif Regular" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes" /v "Segoe UI Emoji" /t REG_SZ /d "Microsoft Sans Serif Regular" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes" /v "Segoe UI Historic" /t REG_SZ /d "Microsoft Sans Serif Regular" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes" /v "Segoe UI Light Italic" /t REG_SZ /d "Microsoft Sans Serif Regular" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes" /v "Segoe UI Semibold Italic" /t REG_SZ /d "Microsoft Sans Serif Regular" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes" /v "Segoe UI Semilight" /t REG_SZ /d "Microsoft Sans Serif Regular" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes" /v "Segoe UI Semilight Italic" /t REG_SZ /d "Microsoft Sans Serif Regular" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes" /v "Segoe UI Bold" /t REG_SZ /d "Microsoft Sans Serif Regular" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes" /v "Segoe UI Bold Italic" /t REG_SZ /d "Microsoft Sans Serif Regular" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes" /v "Segoe UI Italic" /t REG_SZ /d "Microsoft Sans Serif Regular" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes" /v "Segoe UI Light" /t REG_SZ /d "Microsoft Sans Serif Regular" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes" /v "Segoe UI Semibold" /t REG_SZ /d "Microsoft Sans Serif Regular" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\FontSubstitutes" /v "Segoe UI Symbol" /t REG_SZ /d "Microsoft Sans Serif Regular" /f

PAUSE
