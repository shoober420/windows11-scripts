REM Rename Fonts directory
REM Debloat extra fonts

REM Windows 95/98 uses Microsoft Sans Serif
REM Windows XP/7 uses Tahoma
REM Windows 10 uses Segoe UI
REM Windows 11 uses Segoe UI Variable

REM You must remove all Segoe* fonts in the "C:\Windows\Fonts" directory for this batch script to work

REM Deleting fonts via the Fonts directory directly does NOT delete the actual font files inside the directory, it only disables the font and leaves the files behind

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

REM Remove all Segoe* fonts

REM Segoe Fluent Icons Regular
del "%WINDIR%\Fonts\SegoeIcons.ttf"

REM Segoe MDL2 Assets Regular
del "%WINDIR%\Fonts\segmdl2.ttf"

REM Segoe Print
del "%WINDIR%\Fonts\segoepr.ttf"
del "%WINDIR%\Fonts\segoeprb.ttf"

REM Segoe Script
del "%WINDIR%\Fonts\segoesc.ttf"
del "%WINDIR%\Fonts\segoescb.ttf"

REM Segoe UI
del "%WINDIR%\Fonts\segoeui.ttf"
del "%WINDIR%\Fonts\segoeuib.ttf"
del "%WINDIR%\Fonts\segoeuii.ttf"
del "%WINDIR%\Fonts\segoeuil.ttf"
del "%WINDIR%\Fonts\segoeuisl.ttf"
del "%WINDIR%\Fonts\segoeuiz.ttf"
del "%WINDIR%\Fonts\seguibl.ttf"
del "%WINDIR%\Fonts\seguibli.ttf"
del "%WINDIR%\Fonts\seguili.ttf"
del "%WINDIR%\Fonts\seguisb.ttf"
del "%WINDIR%\Fonts\seguisbi.ttf"
del "%WINDIR%\Fonts\seguisli.ttf"

REM Segoe UI Emoji Regular
del "%WINDIR%\Fonts\seguiemj.ttf"

REM Segoe UI Historic Regular
del "%WINDIR%\Fonts\seguihis.ttf"

REM Segoe UI Symbol Regular
del "%WINDIR%\Fonts\seguisym.ttf"

REM Segoe UI Variable
del "%WINDIR%\Fonts\SegUIVar.ttf"

REM Remove bloat fonts

REM app fonts
del "%WINDIR%\Fonts\app*"

REM 8514oem Regular
del "%WINDIR%\Fonts\8514oemt.fon"
del "%WINDIR%\Fonts\85*"
del "%WINDIR%\Fonts\c8514fix.fon"
del "%WINDIR%\Fonts\c8514oem.fon"
del "%WINDIR%\Fonts\c8514sys.fon"

REM cga fonts
del "%WINDIR%\Fonts\cga*"

REM Yu Gothic / Yu Gothic UI
del "%WINDIR%\Fonts\YuGothB.ttc"
del "%WINDIR%\Fonts\YuGothL.ttc"
del "%WINDIR%\Fonts\YuGothM.ttc"
del "%WINDIR%\Fonts\YuGothR.ttc"

REM Wingdings Regular
del "%WINDIR%\Fonts\wingding.ttf"

REM Webdings Regular
del "%WINDIR%\Fonts\webdings.ttf"

REM Terminal Greek 869 Bold
del "%WINDIR%\Fonts\dos869.fon"

REM Terminal Greek 737 (437G) Regular
del "%WINDIR%\Fonts\8514oemg.fon"

REM Symbol Regular
del "%WINDIR%\Fonts\symbol.ttf"

REM Sylfaen Regular
del "%WINDIR%\Fonts\sylfaen.ttf"

REM Sitka
del "%WINDIR%\Fonts\SitkaVF.ttf"
del "%WINDIR%\Fonts\SitkaVF-Italic.ttf"

REM SimSun-ExtB Regular
del "%WINDIR%\Fonts\simsunb.ttf"

REM SimSun Regular / NSimSun Regular
del "%WINDIR%\Fonts\simsun.ttc"

REM Script Regular
del "%WINDIR%\Fonts\script.fon"

REM MingLiU-ExtB Regular  / MingLiU_HKSCS-ExtB Regular / MingLiU_MSCS-ExtB Regular / PMingLiU-ExtB Regular
del "%WINDIR%\Fonts\mingliub.ttc"

REM Palatino Linotype
del "%WINDIR%\Fonts\pala.ttf"
del "%WINDIR%\Fonts\palab.ttf"
del "%WINDIR%\Fonts\palabi.ttf"
del "%WINDIR%\Fonts\palai.ttf"

REM Nirmala UI / Nirmala Text
del "%WINDIR%\Fonts\Nirmala.ttc"

REM Myanmar Text
del "%WINDIR%\Fonts\mmrtext.ttf"
del "%WINDIR%\Fonts\mmrtextb.ttf"

REM MV Boli Reuglar
del "%WINDIR%\Fonts\mvboli.ttf"

REM Mongolian Baiti Regular
del "%WINDIR%\Fonts\monbaiti.ttf"

REM Modern Regular
del "%WINDIR%\Fonts\modern.fon"

REM Microsoft Yi Baiti Regular
del "%WINDIR%\Fonts\msyi.ttf"

REM Microsoft YaHei / Microsoft YaHei UI
del "%WINDIR%\Fonts\msyh.ttc"
del "%WINDIR%\Fonts\msyhbd.ttc"
del "%WINDIR%\Fonts\msyhl.ttc"

REM Microsoft Tai Le
del "%WINDIR%\Fonts\taile.ttf
del "%WINDIR%\Fonts\taileb.ttf"

REM Microsoft PhagsPa
del "%WINDIR%\Fonts\phagspa.ttf"
del "%WINDIR%\Fonts\phagspab.ttf"

REM Microsoft New Tai Lue
del "%WINDIR%\Fonts\ntailu.ttf"
del "%WINDIR%\Fonts\ntailub.ttf"

REM Microsoft JhengHei / Microsoft JhengHei UI
del "%WINDIR%\Fonts\msjh.ttc"
del "%WINDIR%\Fonts\msjhbd.ttc"
del "%WINDIR%\Fonts\msjhl.ttc"

REM Microsoft Himalaya Regular
del "%WINDIR%\Fonts\himalaya.ttf"

REM Malgun Gothic
del "%WINDIR%\Fonts\malgun.ttf"
del "%WINDIR%\Fonts\malgunbd.ttf"
del "%WINDIR%\Fonts\malgunsl.ttf"

REM Leelawadee UI
del "%WINDIR%\Fonts\LeelaUIb.ttf"
del "%WINDIR%\Fonts\LeelawUI.ttf"
del "%WINDIR%\Fonts\LeelUIsl.ttf"

REM Javanese Text Regular
del "%WINDIR%\Fonts\javatext.ttf"

REM Ink Free Regular
del "%WINDIR%\Fonts\Inkfree.ttf"

REM Impact Regular
del "%WINDIR%\Fonts\impact.ttf"

REM HoloLens MDL2 Assets Regular
del "%WINDIR%\Fonts\holomdl2.ttf"

REM Gadugi
del "%WINDIR%\Fonts\gadugi.ttf"
del "%WINDIR%\Fonts\gadugib.ttf"

REM Ebrima
del "%WINDIR%\Fonts\ebrima.ttf"
del "%WINDIR%\Fonts\ebrimabd.ttf"

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
