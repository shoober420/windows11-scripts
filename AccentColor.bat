rem # Accent color

rem # Using Light Theme will NOT allow you to change startmenu and titlebar color

rem # Windows 95 used HTML 3.0 Web Colors

rem # Windows 95 used Silver Gray for Start Menu / Taskbar (192 192 192)
rem # Windows 95 used Navy Blue for Titlebars (0 0 128)

rem # HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors controls CTRL+ALT+DEL theme colors

rem # HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast and HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard reg paths (empty directory) needed to fix CTRL+ALT+DEL bug that reverts theme when pressed

rem # http://franck.kiechel.free.fr/dbr_eng/Shell.htm

rem # rem # https://www.neowin.net/forum/topic/624901-windows-colors-explained/

rem # https://gist.github.com/zaxbux/64b5a88e2e390fb8f8d24eb1736f71e0

rem # Pitch Black by AveYo, AccentPalette idea by /u/Egg-Tricky

rem # ENABLE HIGH CONTRAST WINDOWS 95 THEME
rem # 1. CTRL+ALT+DEL < Accessibility < Contrast themes: On
rem # 2. Re-run this script with High Contrast enabled
rem # 3. Restart

rem # There is a bug when enabling High Contrast theme using "Settings < Personalization < Colors < Contrast themes < Night sky < Apply" method that will revert theme to Accent theme when pressing CTRL+ALT+DEL and going back to desktop

rem # There is a bug with using Win95 High Contrast Theme when pressing CTRL+ALT+DEL and going back to desktop, theme colors are changed

PAUSE

rem # Accent Palette Binary Example (Teal)
rem # https://gist.github.com/AveYo/80fc6677b9f34939e44364880fbf3768

rem # aa = alpha / ff = alpha 255 (disabled)

rem #    "AccentPalette"=hex:\
rem #    00,80,80,aa,\                     ; Links in action center and apps
rem #    00,80,80,aa,\                     ; Taskbar icons underline
rem #    00,80,80,aa,\                     ; Start button hover
rem #    00,80,80,aa,\                     ; Settings icons and links [Teal]
rem #    00,80,80,aa,\                     ; Startmenu background / Active taskbar button - IF "EnableTransparency"=dword:00000000
rem #    00,80,80,aa,\                     ; Taskbar front and Folders on start list background [None]
rem #    00,80,80,aa,\                     ; Taskbar background - IF "EnableTransparency"=dword:00000001
rem #    00,80,80,aa                       ; Unused

rem # reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "008080ff008080ff008080ff008080ff008080ff008080ff008080ff008080ff" /f

rem # Win10 Blue (RGB: 53 126 199 / BGR: 199 126 53) = 0xff357ec7 / 0xffc77e35
rem # Win2000/WinXP Blue (RGB: 58 110 165 / BGR: 165 110 58) = 0xff3a6ea5 / 0xffa56e3a
rem # Win95 Blue (RGB: 0 0 255 / BGR: 255 0 0) = 0xff0000ff / 0xffff0000
rem # Win95 Navy (RGB: 0 0 128 / BGR: 128 0 0) = 0xff000080 / 0xff800000
rem # Win95/98 Teal (RGB: 0 128 128 / BGR: 128 128 0) = 0xff008080 / 0xff808000
rem # Seafoam (RGB: 0 183 195 / BGR: 195 183 00) = 0xff00b6c3 / 0xffc3b600
rem # Win95/98 Gray (RGB: 128 128 128 / BGR: 128 128 128) = 0xff808080 / 0xff808080
rem # Win95/98 Silver (RGB: 192 192 192 / BGR: 192 192 192) = 0xffc0c0c0 / 0xffc0c0c0
rem # Win11 Black Dark Theme (RGB: 18 18 18 / BGR: 18 18 18) = 0xff121212 / 0xff121212
rem # Win11 White Smoke Light Theme (RGB: 242 242 242 / BGR: 242 242 242) = 0xfff2f2f2 / 0xfff2f2f2
rem # White (RGB: 255 255 255 / BGR: 255 255 255) = 0x00ffffff / 0x00ffffff
rem # Black (RGB: 0 0 0 / BGR: 0 0 0) = 0x00000000 / 0x00000000
rem # Win95 BSoD (RGB: 0 0 168 / BGR: 168 0 0) = 0xff0000a8 / 0xffa80000
rem # Microsoft Blue (RGB: 0 162 237 / BGR: 237 162 0) = 0xff00a2ed / 0xffeda200

rem # Remove High Contrast Themes (to restore run "sfc /scannow")
takeown /s %computername% /u %username% /f "C:\Windows\Resources\Ease of Access Themes\hc1.theme"
takeown /s %computername% /u %username% /f "C:\Windows\Resources\Ease of Access Themes\hc2.theme"
takeown /s %computername% /u %username% /f "C:\Windows\Resources\Ease of Access Themes\hcblack.theme"
takeown /s %computername% /u %username% /f "C:\Windows\Resources\Ease of Access Themes\hcwhite.theme"

icacls "C:\Windows\Resources\Ease of Access Themes\hc1.theme" /grant:r %username%:F
icacls "C:\Windows\Resources\Ease of Access Themes\hc2.theme" /grant:r %username%:F
icacls "C:\Windows\Resources\Ease of Access Themes\hcblack.theme" /grant:r %username%:F
icacls "C:\Windows\Resources\Ease of Access Themes\hcwhite.theme" /grant:r %username%:F

del "C:\Windows\Resources\Ease of Access Themes\hc1.theme" /s /f /q
del "C:\Windows\Resources\Ease of Access Themes\hc2.theme" /s /f /q
del "C:\Windows\Resources\Ease of Access Themes\hcblack.theme" /s /f /q
del "C:\Windows\Resources\Ease of Access Themes\hcwhite.theme" /s /f /q

rem ren "C:\Windows\Resources\Ease of Access Themes\hc1.theme" "hc1.theme.bak"
rem ren "C:\Windows\Resources\Ease of Access Themes\hc2.theme" "hc2.theme.bak"
rem ren "C:\Windows\Resources\Ease of Access Themes\hcblack.theme" "hcblack.theme.bak"
rem ren "C:\Windows\Resources\Ease of Access Themes\hcwhite.theme" "hcwhite.theme.bak"

rem # Remove Default Accent Themes (to restore run "sfc /scannow")
takeown /s %computername% /u %username% /f "C:\Windows\Resources\Themes\aero.theme"
takeown /s %computername% /u %username% /f "C:\Windows\Resources\Themes\dark.theme"
takeown /s %computername% /u %username% /f "C:\Windows\Resources\Themes\spotlight.theme"
takeown /s %computername% /u %username% /f "C:\Windows\Resources\Themes\themeA.theme"
takeown /s %computername% /u %username% /f "C:\Windows\Resources\Themes\themeB.theme"
takeown /s %computername% /u %username% /f "C:\Windows\Resources\Themes\themeC.theme"
takeown /s %computername% /u %username% /f "C:\Windows\Resources\Themes\themeD.theme"

icacls "C:\Windows\Resources\Themes\aero.theme" /grant:r %username%:F
icacls "C:\Windows\Resources\Themes\dark.theme" /grant:r %username%:F
icacls "C:\Windows\Resources\Themes\spotlight.theme" /grant:r %username%:F
icacls "C:\Windows\Resources\Themes\themeA.theme" /grant:r %username%:F
icacls "C:\Windows\Resources\Themes\themeB.theme" /grant:r %username%:F
icacls "C:\Windows\Resources\Themes\themeC.theme" /grant:r %username%:F
icacls "C:\Windows\Resources\Themes\themeD.theme" /grant:r %username%:F

del "C:\Windows\Resources\Themes\aero.theme" /s /f /q
del "C:\Windows\Resources\Themes\dark.theme" /s /f /q
del "C:\Windows\Resources\Themes\spotlight.theme" /s /f /q
del "C:\Windows\Resources\Themes\themeA.theme" /s /f /q
del "C:\Windows\Resources\Themes\themeB.theme" /s /f /q
del "C:\Windows\Resources\Themes\themeC.theme" /s /f /q
del "C:\Windows\Resources\Themes\themeD.theme" /s /f /q

rem ren "C:\Windows\Resources\Themes\aero.theme" "aero.theme.bak"
rem ren "C:\Windows\Resources\Themes\dark.theme" "dark.theme.bak"
rem ren "C:\Windows\Resources\Themes\spotlight.theme" "spotlight.theme.bak"
rem ren "C:\Windows\Resources\Themes\themeA.theme" "themeA.theme.bak"
rem ren "C:\Windows\Resources\Themes\themeB.theme" "themeB.theme.bak"
rem ren "C:\Windows\Resources\Themes\themeC.theme" "themeC.theme.bak"
rem ren "C:\Windows\Resources\Themes\themeD.theme" "themeD.theme.bak"

rem # Remove Default Colors
rem reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /f
rem reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /f
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /f
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /f
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /ve /d "" /f
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /ve /d "" /f

rem # Show accent color on Start and Taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorPrevalence" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorPrevalence" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "ColorPrevalence" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ColorPrevalence" /t REG_DWORD /d "1" /f

rem # Show accent color on title bars and window borders
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableWindowColorization" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "EnableWindowColorization" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableWindowColorization" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "EnableWindowColorization" /t REG_DWORD /d "1" /f

rem # Automatically pick an Accent Color from my background
reg add "HKCU\Control Panel\Desktop" /v "AutoColorization" /t REG_DWORD /d "0" /f

rem # Windows 95/98 Black Font for Start Menu
reg add "HKCU\Control Panel\Colors" /v "ButtonText" /t REG_SZ /d "0 0 0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "ButtonText" /t REG_DWORD /d "0x00000000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "ButtonText" /t REG_DWORD /d "0x00000000" /f

rem # Windows 95/98 Black Font for Taskbar
reg add "HKCU\Control Panel\Colors" /v "WindowText" /t REG_SZ /d "0 0 0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "WindowText" /t REG_DWORD /d "0x00000000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "WindowText" /t REG_DWORD /d "0x00000000" /f

rem # Windows 95/98 Black Font for Menu Text
reg add "HKCU\Control Panel\Colors" /v "MenuText" /t REG_SZ /d "0 0 0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "MenuText" /t REG_DWORD /d "0x00000000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "MenuText" /t REG_DWORD /d "0x00000000" /f

rem # Windows 95/98 Black Font and White Background for Info Text
reg add "HKCU\Control Panel\Colors" /v "InfoText" /t REG_SZ /d "0 0 0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "InfoText" /t REG_DWORD /d "0x00000000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "InfoText" /t REG_DWORD /d "0x00000000" /f

reg add "HKCU\Control Panel\Colors" /v "InfoWindow" /t REG_SZ /d "255 255 255" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "InfoWindow" /t REG_DWORD /d "0x00ffffff" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "InfoWindow" /t REG_DWORD /d "0x00ffffff" /f

rem # Windows 95 Gray Inactive Title Bar
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColorInactive" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorInactive" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentColorInactive" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentColorInactive" /t REG_DWORD /d "0xff808080" /f

rem # Windows 95 Title Bars
reg add "HKCU\Control Panel\Colors" /v "ActiveTitle" /t REG_SZ /d "0 0 128" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "ActiveTitle" /t REG_DWORD /d "0x00800000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "ActiveTitle" /t REG_DWORD /d "0x00800000" /f

reg add "HKCU\Control Panel\Colors" /v "InactiveTitle" /t REG_SZ /d "128 128 128" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "InactiveTitle" /t REG_DWORD /d "0x00808080" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "InactiveTitle" /t REG_DWORD /d "0x00808080" /f

reg add "HKCU\Control Panel\Colors" /v "TitleText" /t REG_SZ /d "255 255 255" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "TitleText" /t REG_DWORD /d "0x00ffffff" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "TitleText" /t REG_DWORD /d "0x00ffffff" /f

reg add "HKCU\Control Panel\Colors" /v "InactiveTitleText" /t REG_SZ /d "192 192 192" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "InactiveTitleText" /t REG_DWORD /d "0x00c0c0c0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "InactiveTitleText" /t REG_DWORD /d "0x00c0c0c0" /f

reg add "HKCU\Control Panel\Colors" /v "GradientActiveTitle" /t REG_SZ /d "0 0 128" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "GradientActiveTitle" /t REG_DWORD /d "0x00800000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "GradientActiveTitle" /t REG_DWORD /d "0x00800000" /f

reg add "HKCU\Control Panel\Colors" /v "GradientInactiveTitle" /t REG_SZ /d "128 128 128" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "GradientInactiveTitle" /t REG_DWORD /d "0x00808080" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "GradientInactiveTitle" /t REG_DWORD /d "0x00808080" /f

rem # Windows 95 Borders
reg add "HKCU\Control Panel\Colors" /v "ActiveBorder" /t REG_SZ /d "192 192 192" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "ActiveBorder" /t REG_DWORD /d "0x00c0c0c0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "ActiveBorder" /t REG_DWORD /d "0x00c0c0c0" /f

reg add "HKCU\Control Panel\Colors" /v "InactiveBorder" /t REG_SZ /d "192 192 192" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "InactiveBorder" /t REG_DWORD /d "0x00c0c0c0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "InactiveBorder" /t REG_DWORD /d "0x00c0c0c0" /f

rem # Windows 95 White Window Background
reg add "HKCU\Control Panel\Colors" /v "Window" /t REG_SZ /d "255 255 255" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Window" /t REG_DWORD /d "0x00ffffff" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Window" /t REG_DWORD /d "0x00ffffff" /f

rem # Windows 95 Menu Border Color
reg add "HKCU\Control Panel\Colors" /v "WindowFrame" /t REG_SZ /d "0 0 0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "WindowFrame" /t REG_DWORD /d "0x00000000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "WindowFrame" /t REG_DWORD /d "0x00000000" /f

rem # Windows 95 Menus
reg add "HKCU\Control Panel\Colors" /v "GrayText" /t REG_SZ /d "128 128 128" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "GrayText" /t REG_DWORD /d "0x00808080" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "GrayText" /t REG_DWORD /d "0x00808080" /f

reg add "HKCU\Control Panel\Colors" /v "Menu" /t REG_SZ /d "192 192 192" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Menu" /t REG_DWORD /d "0x00c0c0c0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Menu" /t REG_DWORD /d "0x00c0c0c0" /f

reg add "HKCU\Control Panel\Colors" /v "MenuBar" /t REG_SZ /d "192 192 192" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "MenuBar" /t REG_DWORD /d "0x00c0c0c0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "MenuBar" /t REG_DWORD /d "0x00c0c0c0" /f

reg add "HKCU\Control Panel\Colors" /v "MenuHilight" /t REG_SZ /d "0 0 128" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "MenuHilight" /t REG_DWORD /d "0x00800000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "MenuHilight" /t REG_DWORD /d "0x00800000" /f

rem # Windows 95 Buttons
rem # Light Golden Rod Yellow - RGB: 223 223 223 / BGR: 223 223 223 = 0xffdfdfdf / 0xffdfdfdf
reg add "HKCU\Control Panel\Colors" /v "ButtonAlternateFace" /t REG_SZ /d "192 192 192" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "ButtonAlternateFace" /t REG_DWORD /d "0x00c0c0c0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "ButtonAlternateFace" /t REG_DWORD /d "0x00c0c0c0" /f

reg add "HKCU\Control Panel\Colors" /v "ButtonDkShadow" /t REG_SZ /d "0 0 0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "ButtonDkShadow" /t REG_DWORD /d "0x00000000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "ButtonDkShadow" /t REG_DWORD /d "0x00000000" /f

reg add "HKCU\Control Panel\Colors" /v "ButtonFace" /t REG_SZ /d "192 192 192" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "ButtonFace" /t REG_DWORD /d "0x00c0c0c0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "ButtonFace" /t REG_DWORD /d "0x00c0c0c0" /f

reg add "HKCU\Control Panel\Colors" /v "ButtonHilight" /t REG_SZ /d "255 255 255" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "ButtonHilight" /t REG_DWORD /d "0x00ffffff" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "ButtonHilight" /t REG_DWORD /d "0x00ffffff" /f

reg add "HKCU\Control Panel\Colors" /v "ButtonLight" /t REG_SZ /d "223 223 223" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "ButtonLight" /t REG_DWORD /d "0x00dfdfdf" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "ButtonLight" /t REG_DWORD /d "0x00dfdfdf" /f

reg add "HKCU\Control Panel\Colors" /v "ButtonShadow" /t REG_SZ /d "128 128 128" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "ButtonShadow" /t REG_DWORD /d "0x00808080" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "ButtonShadow" /t REG_DWORD /d "0x00808080" /f

rem # Windows 95 Navy Hilight
rem # Highlighted Menu Color
reg add "HKCU\Control Panel\Colors" /v "Hilight" /t REG_SZ /d "0 0 128" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Hilight" /t REG_DWORD /d "0x00800000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Hilight" /t REG_DWORD /d "0x00800000" /f

reg add "HKCU\Control Panel\Colors" /v "HilightText" /t REG_SZ /d "255 255 255" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "HilightText" /t REG_DWORD /d "0x00ffffff" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "HilightText" /t REG_DWORD /d "0x00ffffff" /f

rem # Windows 95 Silver Scrollbar
reg add "HKCU\Control Panel\Colors" /v "Scrollbar" /t REG_SZ /d "192 192 192" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Scrollbar" /t REG_DWORD /d "0x00c0c0c0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Scrollbar" /t REG_DWORD /d "0x00c0c0c0" /f

rem # Windows 95 App Workspace Color
reg add "HKCU\Control Panel\Colors" /v "AppWorkspace" /t REG_SZ /d "128 128 128" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "AppWorkspace" /t REG_DWORD /d "0x00808080" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "AppWorkspace" /t REG_DWORD /d "0x00808080" /f

rem # Windows 95 Hot Tracking Color
reg add "HKCU\Control Panel\Colors" /v "HotTrackingColor" /t REG_SZ /d "0 0 128" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "HotTrackingColor" /t REG_DWORD /d "0x00800000" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "HotTrackingColor" /t REG_DWORD /d "0x00800000" /f

rem # Delete Accent Color History
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\History\Colors" /v "ColorHistory0" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\History\Colors" /v "ColorHistory1" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\History\Colors" /v "ColorHistory2" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\History\Colors" /v "ColorHistory3" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\History\Colors" /v "ColorHistory4" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\History\Colors" /v "ColorHistory5" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\History\Colors" /f



@echo off

@echo off

echo.
echo Light or Dark Theme
echo.
echo 1. Dark Theme
echo 2. Light Theme
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :light
) else if 1 EQU %ERRORLEVEL% (
   call :dark
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:light
echo User chose Light Theme

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d "1" /f
rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorPrevalence" /t REG_DWORD /d "0" /f

rem reg add "HKCU\Control Panel\Colors" /v "Window" /t REG_SZ /d "242 242 242" /f
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Window" /t REG_DWORD /d "" /f
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Window" /t REG_DWORD /d "" /f

goto :end

:dark
echo User chose Dark Theme

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d "0" /f
rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorPrevalence" /t REG_DWORD /d "1" /f

goto :end

:end

echo.
echo Title Bar Color
echo.
echo 1. Win10 Blue
echo 2. Win2000/WinXP Blue
echo 3. Win95 Blue
echo 4. Win95 Navy
echo 5. Win95/98 Teal
echo 6. Win95/98 Gray
echo 7. Win95/98 Silver
echo 8. Seafoam
echo 9. Black
echo C. Cancel
echo.
choice /c 123456789C /m "Choose an option :"

if 9 EQU %ERRORLEVEL% (
   call :pitchb
) else if 8 EQU %ERRORLEVEL% (
   call :seafoam
) else if 7 EQU %ERRORLEVEL% (
   call :silver
) else if 6 EQU %ERRORLEVEL% (
   call :gray
) else if 5 EQU %ERRORLEVEL% (
   call :teal
) else if 4 EQU %ERRORLEVEL% (
   call :navy
) else if 3 EQU %ERRORLEVEL% (
   call :95blue
) else if 2 EQU %ERRORLEVEL% (
   call :win2000b
) else if 1 EQU %ERRORLEVEL% (
   call :win10blue
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:win10blue
echo User chose Win10 Blue

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "0xffc77e35" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColor" /t REG_DWORD /d "0xffc77e35" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationColor" /t REG_DWORD /d "0xffc77e35" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColor" /t REG_DWORD /d "0xffc77e35" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColor" /t REG_DWORD /d "0xffc77e35" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "ColorizationColor" /t REG_DWORD /d "0xffc77e35" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentColor" /t REG_DWORD /d "0xffc77e35" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "StartColor" /t REG_DWORD /d "0xffc77e35" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorizationColor" /t REG_DWORD /d "0xffc77e35" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentColor" /t REG_DWORD /d "0xffc77e35" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartColor" /t REG_DWORD /d "0xffc77e35" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ColorizationColor" /t REG_DWORD /d "0xffc77e35" /f

rem # Start Menu / Taskbar
rem reg add "HKCU\Control Panel\Colors" /v "Window" /t REG_SZ /d "53 126 199" /f
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Window" /t REG_DWORD /d "0x00c77e35" /f
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Window" /t REG_DWORD /d "0x00c77e35" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xffc77e35" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColorMenu" /t REG_DWORD /d "0xffc77e35" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "StartColorMenu" /t REG_DWORD /d "0xffc77e35" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartColorMenu" /t REG_DWORD /d "0xffc77e35" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffc77e35" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffc77e35" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffc77e35" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffc77e35" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d "0xffc77e35" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColorMenu" /t REG_DWORD /d "0xffc77e35" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentColorMenu" /t REG_DWORD /d "0xffc77e35" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentColorMenu" /t REG_DWORD /d "0xffc77e35" /f

rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff" /f
rem reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentPalette" /t REG_BINARY /d "357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff" /f
rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentPalette" /t REG_BINARY /d "357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff" /f
rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentPalette" /t REG_BINARY /d "357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff" /f

goto :end

:win2000b
echo User chose Win2000/WinXP Blue

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColor" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationColor" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColor" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColor" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "ColorizationColor" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentColor" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "StartColor" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorizationColor" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentColor" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartColor" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ColorizationColor" /t REG_DWORD /d "0xffa56e3a" /f

rem # Start Menu / Taskbar
rem reg add "HKCU\Control Panel\Colors" /v "Window" /t REG_SZ /d "58 110 165" /f
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Window" /t REG_DWORD /d "0x00a56e3a" /f
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Window" /t REG_DWORD /d "0x00a56e3a" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColorMenu" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "StartColorMenu" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartColorMenu" /t REG_DWORD /d "0xffa56e3a" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffa56e3a" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColorMenu" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentColorMenu" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentColorMenu" /t REG_DWORD /d "0xffa56e3a" /f

rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff" /f
rem reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentPalette" /t REG_BINARY /d "3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff" /f
rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentPalette" /t REG_BINARY /d "3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff" /f
rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentPalette" /t REG_BINARY /d "3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff" /f

goto :end

:95blue
echo User chose Win95 Blue

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColor" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationColor" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColor" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColor" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "ColorizationColor" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentColor" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "StartColor" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorizationColor" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentColor" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartColor" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ColorizationColor" /t REG_DWORD /d "0xffff0000" /f

rem # Start Menu / Taskbar
rem reg add "HKCU\Control Panel\Colors" /v "Window" /t REG_SZ /d "0 0 255" /f
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Window" /t REG_DWORD /d "0x00ff0000" /f
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Window" /t REG_DWORD /d "0x00ff0000" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColorMenu" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "StartColorMenu" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartColorMenu" /t REG_DWORD /d "0xffff0000" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffff0000" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColorMenu" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentColorMenu" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentColorMenu" /t REG_DWORD /d "0xffff0000" /f

rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff" /f
rem reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentPalette" /t REG_BINARY /d "0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff" /f
rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentPalette" /t REG_BINARY /d "0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff" /f
rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentPalette" /t REG_BINARY /d "0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff" /f

goto :end

:navy
echo User chose Win95 Navy

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColor" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationColor" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColor" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColor" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "ColorizationColor" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentColor" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "StartColor" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorizationColor" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentColor" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartColor" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ColorizationColor" /t REG_DWORD /d "0xff800000" /f

rem # Start Menu / Taskbar
rem reg add "HKCU\Control Panel\Colors" /v "Window" /t REG_SZ /d "0 0 128" /f
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Window" /t REG_DWORD /d "0x00800000" /f
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Window" /t REG_DWORD /d "0x00800000" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColorMenu" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "StartColorMenu" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartColorMenu" /t REG_DWORD /d "0xff800000" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff800000" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColorMenu" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentColorMenu" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentColorMenu" /t REG_DWORD /d "0xff800000" /f

rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "000080ff000080ff000080ff000080ff000080ff000080ff000080ff000080ff" /f
rem reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentPalette" /t REG_BINARY /d "000080ff000080ff000080ff000080ff000080ff000080ff000080ff000080ff" /f
rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentPalette" /t REG_BINARY /d "000080ff000080ff000080ff000080ff000080ff000080ff000080ff000080ff" /f
rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentPalette" /t REG_BINARY /d "000080ff000080ff000080ff000080ff000080ff000080ff000080ff000080ff" /f

goto :end

:teal
echo User chose Win95/98 Teal

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "0xff808000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColor" /t REG_DWORD /d "0xff808000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationColor" /t REG_DWORD /d "0xff808000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColor" /t REG_DWORD /d "0xff808000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColor" /t REG_DWORD /d "0xff808000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "ColorizationColor" /t REG_DWORD /d "0xff808000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentColor" /t REG_DWORD /d "0xff808000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "StartColor" /t REG_DWORD /d "0xff808000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorizationColor" /t REG_DWORD /d "0xff808000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentColor" /t REG_DWORD /d "0xff808000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartColor" /t REG_DWORD /d "0xff808000" /
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ColorizationColor" /t REG_DWORD /d "0xff808000" /f

rem # Start Menu / Taskbar
rem reg add "HKCU\Control Panel\Colors" /v "Window" /t REG_SZ /d "0 128 128" /f
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Window" /t REG_DWORD /d "0x00808000" /f
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Window" /t REG_DWORD /d "0x00808000" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xff808000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColorMenu" /t REG_DWORD /d "0xff808000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "StartColorMenu" /t REG_DWORD /d "0xff808000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartColorMenu" /t REG_DWORD /d "0xff808000" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff808000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff808000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff808000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff808000" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d "0xff808000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColorMenu" /t REG_DWORD /d "0xff808000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentColorMenu" /t REG_DWORD /d "0xff808000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentColorMenu" /t REG_DWORD /d "0xff808000" /f

rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "008080ff008080ff008080ff008080ff008080ff008080ff008080ff008080ff" /f
rem reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentPalette" /t REG_BINARY /d "008080ff008080ff008080ff008080ff008080ff008080ff008080ff008080ff" /f
rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentPalette" /t REG_BINARY /d "008080ff008080ff008080ff008080ff008080ff008080ff008080ff008080ff" /f
rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentPalette" /t REG_BINARY /d "008080ff008080ff008080ff008080ff008080ff008080ff008080ff008080ff" /f

goto :end

:seafoam
echo User chose Seafoam

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "0xffc3b700" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColor" /t REG_DWORD /d "0xffc3b700" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationColor" /t REG_DWORD /d "0xffc3b700" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColor" /t REG_DWORD /d "0xffc3b700" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColor" /t REG_DWORD /d "0xffc3b700" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "ColorizationColor" /t REG_DWORD /d "0xffc3b700" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentColor" /t REG_DWORD /d "0xffc3b700" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "StartColor" /t REG_DWORD /d "0xffc3b700" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorizationColor" /t REG_DWORD /d "0xffc3b700" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentColor" /t REG_DWORD /d "0xffc3b700" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartColor" /t REG_DWORD /d "0xffc3b700" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ColorizationColor" /t REG_DWORD /d "0xffc3b700" /f

rem # Start Menu / Taskbar
rem reg add "HKCU\Control Panel\Colors" /v "Window" /t REG_SZ /d "0 183 195" /f
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Window" /t REG_DWORD /d "0x00c3b700" /f
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Window" /t REG_DWORD /d "0x00c3b700" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xffc3b700" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColorMenu" /t REG_DWORD /d "0xffc3b700" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "StartColorMenu" /t REG_DWORD /d "0xffc3b700" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartColorMenu" /t REG_DWORD /d "0xffc3b700" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffc3b700" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffc3b700" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffc3b700" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffc3b700" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d "0xffc3b700" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColorMenu" /t REG_DWORD /d "0xffc3b700" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentColorMenu" /t REG_DWORD /d "0xffc3b700" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentColorMenu" /t REG_DWORD /d "0xffc3b700" /f

rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff" /f
rem reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentPalette" /t REG_BINARY /d "00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff" /f
rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentPalette" /t REG_BINARY /d "00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff" /f
rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentPalette" /t REG_BINARY /d "00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff" /f

goto :end

:gray
echo User chose Win95/98 Gray

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColor" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationColor" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColor" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColor" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "ColorizationColor" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentColor" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "StartColor" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorizationColor" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentColor" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartColor" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ColorizationColor" /t REG_DWORD /d "0xff808080" /f

rem # Start Menu / Taskbar
rem reg add "HKCU\Control Panel\Colors" /v "Window" /t REG_SZ /d "128 128 128" /f
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Window" /t REG_DWORD /d "0x00808080" /f
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Window" /t REG_DWORD /d "0x00808080" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColorMenu" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "StartColorMenu" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartColorMenu" /t REG_DWORD /d "0xff808080" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff808080" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColorMenu" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentColorMenu" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentColorMenu" /t REG_DWORD /d "0xff808080" /f

rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "808080ff808080ff808080ff808080ff808080ff808080ff808080ff808080ff" /f
rem reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentPalette" /t REG_BINARY /d "808080ff808080ff808080ff808080ff808080ff808080ff808080ff808080ff" /f
rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentPalette" /t REG_BINARY /d "808080ff808080ff808080ff808080ff808080ff808080ff808080ff808080ff" /f
rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentPalette" /t REG_BINARY /d "808080ff808080ff808080ff808080ff808080ff808080ff808080ff808080ff" /f

goto :end

:silver
echo User chose Win95/98 Silver

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "0xffc0c0c0" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColor" /t REG_DWORD /d "0xffc0c0c0" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationColor" /t REG_DWORD /d "0xffc0c0c0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColor" /t REG_DWORD /d "0xffc0c0c0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColor" /t REG_DWORD /d "0xffc0c0c0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "ColorizationColor" /t REG_DWORD /d "0xffc0c0c0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentColor" /t REG_DWORD /d "0xffc0c0c0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "StartColor" /t REG_DWORD /d "0xffc0c0c0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorizationColor" /t REG_DWORD /d "0xffc0c0c0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentColor" /t REG_DWORD /d "0xffc0c0c0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartColor" /t REG_DWORD /d "0xffc0c0c0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ColorizationColor" /t REG_DWORD /d "0xffc0c0c0" /f

rem # Start Menu / Taskbar
rem reg add "HKCU\Control Panel\Colors" /v "Window" /t REG_SZ /d "192 192 192" /f
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Window" /t REG_DWORD /d "0x00c0c0c0" /f
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Window" /t REG_DWORD /d "0x00c0c0c0" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xffc0c0c0" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColorMenu" /t REG_DWORD /d "0xffc0c0c0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "StartColorMenu" /t REG_DWORD /d "0xffc0c0c0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartColorMenu" /t REG_DWORD /d "0xffc0c0c0" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffc0c0c0" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffc0c0c0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffc0c0c0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffc0c0c0" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d "0xffc0c0c0" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColorMenu" /t REG_DWORD /d "0xffc0c0c0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentColorMenu" /t REG_DWORD /d "0xffc0c0c0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentColorMenu" /t REG_DWORD /d "0xffc0c0c0" /f

rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "c0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ff" /f
rem reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentPalette" /t REG_BINARY /d "c0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ff" /f
rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentPalette" /t REG_BINARY /d "c0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ff" /f
rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentPalette" /t REG_BINARY /d "c0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ff" /f

goto :end

:pitchb
echo User chose Black

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "0xff000000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColor" /t REG_DWORD /d "0xff000000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationColor" /t REG_DWORD /d "0xff000000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColor" /t REG_DWORD /d "0xff000000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColor" /t REG_DWORD /d "0xff000000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "ColorizationColor" /t REG_DWORD /d "0xff000000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentColor" /t REG_DWORD /d "0xff000000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "StartColor" /t REG_DWORD /d "0xff000000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorizationColor" /t REG_DWORD /d "0xff000000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentColor" /t REG_DWORD /d "0xff000000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartColor" /t REG_DWORD /d "0xff000000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ColorizationColor" /t REG_DWORD /d "0xff000000" /f

rem # Start Menu / Taskbar
rem reg add "HKCU\Control Panel\Colors" /v "Window" /t REG_SZ /d "0 0 0" /f
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Window" /t REG_DWORD /d "0x00000000" /f
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Window" /t REG_DWORD /d "0xff000000" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xff000000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColorMenu" /t REG_DWORD /d "0xff000000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "StartColorMenu" /t REG_DWORD /d "0xff000000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartColorMenu" /t REG_DWORD /d "0xff000000" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff000000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff000000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff000000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff000000" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d "0xff000000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColorMenu" /t REG_DWORD /d "0xff000000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentColorMenu" /t REG_DWORD /d "0xff000000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentColorMenu" /t REG_DWORD /d "0xff000000" /f

rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "808080ff808080ff808080ff808080ff000000ff000000ff000000ff000000ff" /f
rem reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentPalette" /t REG_BINARY /d "808080ff000000ff808080ff808080ff000000ff000000ff000000ff000000ff" /f
rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentPalette" /t REG_BINARY /d "808080ff000000ff808080ff808080ff000000ff000000ff000000ff000000ff" /f
rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentPalette" /t REG_BINARY /d "808080ff000000ff808080ff808080ff000000ff000000ff000000ff000000ff" /f

goto :end

:end

echo.
echo Start Menu / Taskbar Color
echo.
echo 1. Win10 Blue
echo 2. Win2000/WinXP Blue
echo 3. Win95 Blue
echo 4. Win95 Navy
echo 5. Win95/98 Teal
echo 6. Win95/98 Gray
echo 7. Win95/98 Silver
echo 8. Seafoam
echo 9. Black
echo C. Cancel
echo.
choice /c 123456789C /m "Choose an option :"

if 9 EQU %ERRORLEVEL% (
   call :pblack
) else if 8 EQU %ERRORLEVEL% (
   call :seaf
) else if 7 EQU %ERRORLEVEL% (
   call :sil
) else if 6 EQU %ERRORLEVEL% (
   call :gra
) else if 5 EQU %ERRORLEVEL% (
   call :tea
) else if 4 EQU %ERRORLEVEL% (
   call :nav
) else if 3 EQU %ERRORLEVEL% (
   call :95b
) else if 2 EQU %ERRORLEVEL% (
   call :win2000blue
) else if 1 EQU %ERRORLEVEL% (
   call :winxblue
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:win2000blue
echo User chose Win2000/WinXP Blue

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentPalette" /t REG_BINARY /d "3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentPalette" /t REG_BINARY /d "3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentPalette" /t REG_BINARY /d "3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff" /f

goto :end

:seaf
echo User chose Seafoam

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentPalette" /t REG_BINARY /d "00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentPalette" /t REG_BINARY /d "00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentPalette" /t REG_BINARY /d "00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff" /f

goto :end

:sil
echo User chose Win95/98 Silver

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "c0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ff" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentPalette" /t REG_BINARY /d "c0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentPalette" /t REG_BINARY /d "c0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentPalette" /t REG_BINARY /d "c0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ff" /f

goto :end

:gra
echo User chose Win95/98 Gray

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "808080ff808080ff808080ff808080ff808080ff808080ff808080ff808080ff" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentPalette" /t REG_BINARY /d "808080ff808080ff808080ff808080ff808080ff808080ff808080ff808080ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentPalette" /t REG_BINARY /d "808080ff808080ff808080ff808080ff808080ff808080ff808080ff808080ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentPalette" /t REG_BINARY /d "808080ff808080ff808080ff808080ff808080ff808080ff808080ff808080ff" /f

goto :end

:tea
echo User chose Win95/98 Teal

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "008080ff008080ff008080ff008080ff008080ff008080ff008080ff008080ff" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentPalette" /t REG_BINARY /d "008080ff008080ff008080ff008080ff008080ff008080ff008080ff008080ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentPalette" /t REG_BINARY /d "008080ff008080ff008080ff008080ff008080ff008080ff008080ff008080ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentPalette" /t REG_BINARY /d "008080ff008080ff008080ff008080ff008080ff008080ff008080ff008080ff" /f

goto :end

:winxblue
echo User chose Win10 Blue

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentPalette" /t REG_BINARY /d "357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentPalette" /t REG_BINARY /d "357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentPalette" /t REG_BINARY /d "357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff357ec7ff" /f

goto :end

:95b
echo User chose Win95 Blue

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentPalette" /t REG_BINARY /d "0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentPalette" /t REG_BINARY /d "0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentPalette" /t REG_BINARY /d "0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff" /f

goto :end

:nav
echo User chose Win95 Navy

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "000080ff000080ff000080ff000080ff000080ff000080ff000080ff000080ff" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentPalette" /t REG_BINARY /d "000080ff000080ff000080ff000080ff000080ff000080ff000080ff000080ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentPalette" /t REG_BINARY /d "000080ff000080ff000080ff000080ff000080ff000080ff000080ff000080ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentPalette" /t REG_BINARY /d "000080ff000080ff000080ff000080ff000080ff000080ff000080ff000080ff" /f

goto :end

:pblack
echo User chose Black

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "808080ff808080ff808080ff808080ff000000ff000000ff000000ff000000ff" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentPalette" /t REG_BINARY /d "808080ff000000ff808080ff808080ff000000ff000000ff000000ff000000ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentPalette" /t REG_BINARY /d "808080ff000000ff808080ff808080ff000000ff000000ff000000ff000000ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentPalette" /t REG_BINARY /d "808080ff000000ff808080ff808080ff000000ff000000ff000000ff000000ff" /f

goto :end

:end

echo.
echo Windows 95 Gray Start Menu / Taskbar for High Contrast Theme
echo.
echo 1. Enable Win95 Gray Start Menu / Taskbar for High Contrast Theme
echo 2. Default for Accent Theme
echo C. Cancel
echo.
choice /c 12C /m "Choose an option :"

if 3 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 2 EQU %ERRORLEVEL% (
   call :accent
) else if 1 EQU %ERRORLEVEL% (
   call :highc
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:highc
echo User chose Enable Win95 Gray Start Menu / Taskbar for High Contrast Theme

reg add "HKCU\Control Panel\Colors" /v "Window" /t REG_SZ /d "192 192 192" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Window" /t REG_DWORD /d "0x00c0c0c0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Window" /t REG_DWORD /d "0x00c0c0c0" /f

goto :end

:accent
echo User chose Default for Accent Theme

reg add "HKCU\Control Panel\Colors" /v "Window" /t REG_SZ /d "255 255 255" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\HighContrast" /v "Window" /t REG_DWORD /d "0x00ffffff" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\DefaultColors\Standard" /v "Window" /t REG_DWORD /d "0x00ffffff" /f

goto :end

:end

PAUSE