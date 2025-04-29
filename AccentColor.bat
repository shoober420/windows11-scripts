rem # Accent color

rem # Using Light Theme will NOT allow you to change startmenu and titlebar color

rem # Windows 95 used HTML 3.0 Web Colors

rem # Windows 95 used Silver Gray for Start Menu / Taskbar (192 192 192)
rem # Windows 95 used Navy Blue for Titlebars (0 0 128)

rem # http://franck.kiechel.free.fr/dbr_eng/Shell.htm

rem # rem # https://www.neowin.net/forum/topic/624901-windows-colors-explained/

rem # ENABLE HIGH CONTRAST WINDOWS 95 THEME
rem # 1. Settings < Personalization < Colors < Contrast themes < Night sky < Apply
rem # 2. Re-run this script with High Contrast enabled
rem # 3. Restart

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

rem # Win10/11 Dodger Blue (RGB: 0 120 215 / BGR: 215 120 0) = 0xff0078d7 / 0xffd77800
rem # Win2000/WinXP Steel Blue (RGB: 58 110 165 / BGR: 165 110 58) = 0xff3a6ea5 / 0xffa56e3a
rem # Win95 Blue (RGB: 0 0 255 / BGR: 255 0 0) = 0xff0000ff / 0xffff0000
rem # Win95 Navy (RGB: 0 0 128 / BGR: 128 0 0) = 0xff000080 / 0xff800000
rem # Win95/98 Teal (RGB: 0 128 128 / BGR: 128 128 0) = 0xff008080 / 0xff808000
rem # Seafoam/Dark Turquoise (RGB: 0 183 195 / BGR: 195 183 00) = 0xff00b6c3 / 0xffc3b600
rem # Win95/98 Gray (RGB: 128 128 128 / BGR: 128 128 128) = 0xff808080 / 0xff808080
rem # Win95/98 Silver (RGB: 192 192 192 / BGR: 192 192 192) = 0xffc0c0c0 / 0xffc0c0c0
rem # Win11 Black Dark Theme (RGB: 18 18 18 / BGR: 18 18 18) = 0xff121212 / 0xff121212
rem # Win11 White Smoke Light Theme (RGB: 242 242 242 / BGR: 242 242 242) = 0xfff2f2f2 / 0xfff2f2f2

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

rem # Windows 95/98 Black Font for Taskbar
reg add "HKCU\Control Panel\Colors" /v "WindowText" /t REG_SZ /d "0 0 0" /f

rem # Windows 95/98 Black Font for Menu Text
reg add "HKCU\Control Panel\Colors" /v "MenuText" /t REG_SZ /d "0 0 0" /f

rem # Windows 95/98 Black Font and White Background for Info Text
reg add "HKCU\Control Panel\Colors" /v "InfoText" /t REG_SZ /d "0 0 0" /f
reg add "HKCU\Control Panel\Colors" /v "InfoWindow" /t REG_SZ /d "255 255 255" /f

rem # Windows 95 Gray Inactive Title Bar
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColorInactive" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorInactive" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentColorInactive" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentColorInactive" /t REG_DWORD /d "0xff808080" /f

rem # Windows 95 Title Bars
reg add "HKCU\Control Panel\Colors" /v "ActiveTitle" /t REG_SZ /d "0 0 128" /f
reg add "HKCU\Control Panel\Colors" /v "InactiveTitle" /t REG_SZ /d "128 128 128" /f
reg add "HKCU\Control Panel\Colors" /v "TitleText" /t REG_SZ /d "255 255 255" /f
reg add "HKCU\Control Panel\Colors" /v "InactiveTitleText" /t REG_SZ /d "192 192 192" /f
reg add "HKCU\Control Panel\Colors" /v "GradientActiveTitle" /t REG_SZ /d "0 0 128" /f
reg add "HKCU\Control Panel\Colors" /v "GradientInactiveTitle" /t REG_SZ /d "128 128 128" /f

rem # Windows 95 Borders
reg add "HKCU\Control Panel\Colors" /v "ActiveBorder" /t REG_SZ /d "192 192 192" /f
reg add "HKCU\Control Panel\Colors" /v "InactiveBorder" /t REG_SZ /d "192 192 192" /f

rem # Windows 95 White Window Background
reg add "HKCU\Control Panel\Colors" /v "Window" /t REG_SZ /d "255 255 255" /f

rem # Windows 95 Menu Border Color
reg add "HKCU\Control Panel\Colors" /v "WindowFrame" /t REG_SZ /d "0 0 0" /f

rem # Windows 95 Menus
reg add "HKCU\Control Panel\Colors" /v "GrayText" /t REG_SZ /d "128 128 128" /f
reg add "HKCU\Control Panel\Colors" /v "Menu" /t REG_SZ /d "192 192 192" /f
reg add "HKCU\Control Panel\Colors" /v "MenuBar" /t REG_SZ /d "192 192 192" /f
reg add "HKCU\Control Panel\Colors" /v "MenuHilight" /t REG_SZ /d "0 0 128" /f

rem # Windows 95 Buttons
rem # Light Golden Rod Yellow - RGB: 223 223 223 / BGR: 223 223 223 = 0xffdfdfdf / 0xffdfdfdf
reg add "HKCU\Control Panel\Colors" /v "ButtonAlternateFace" /t REG_SZ /d "192 192 192" /f
reg add "HKCU\Control Panel\Colors" /v "ButtonDkShadow" /t REG_SZ /d "0 0 0" /f
reg add "HKCU\Control Panel\Colors" /v "ButtonFace" /t REG_SZ /d "192 192 192" /f
reg add "HKCU\Control Panel\Colors" /v "ButtonHilight" /t REG_SZ /d "255 255 255" /f
reg add "HKCU\Control Panel\Colors" /v "ButtonLight" /t REG_SZ /d "223 223 223" /f
reg add "HKCU\Control Panel\Colors" /v "ButtonShadow" /t REG_SZ /d "128 128 128" /f

rem # Windows 95 Navy Hilight
rem # Highlighted Menu Color
reg add "HKCU\Control Panel\Colors" /v "Hilight" /t REG_SZ /d "0 0 128" /f
reg add "HKCU\Control Panel\Colors" /v "HilightText" /t REG_SZ /d "255 255 255" /f

rem # Windows 95 Silver Scrollbar
reg add "HKCU\Control Panel\Colors" /v "Scrollbar" /t REG_SZ /d "192 192 192" /f

rem # Windows 95 App Workspace Color
reg add "HKCU\Control Panel\Colors" /v "AppWorkspace" /t REG_SZ /d "128 128 128" /f

rem # Windows 95 Hot Tracking Color
reg add "HKCU\Control Panel\Colors" /v "HotTrackingColor" /t REG_SZ /d "0 0 128" /f

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
   call :lightt
) else if 1 EQU %ERRORLEVEL% (
   call :darkt
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:lightt
echo User chose Light Theme

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d "1" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d "1" /f
rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorPrevalence" /t REG_DWORD /d "0" /f

rem reg add "HKCU\Control Panel\Colors" /v "Window" /t REG_SZ /d "242 242 242" /f

goto :end

:darkt
echo User chose Dark Theme

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d "0" /f
rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorPrevalence" /t REG_DWORD /d "1" /f

goto :end

:end

echo.
echo Accent Color
echo.
echo 1. Win10/11 Dodger Blue
echo 2. Win2000/WinXP Steel Blue
echo 3. Win95 Blue
echo 4. Win95 Navy
echo 5. Win95/98 Teal
echo 6. Win95/98 Gray
echo 7. Win95/98 Silver
echo 8. Seafoam/Dark Turquoise
echo C. Cancel
echo.
choice /c 12345678C /m "Choose an option :"

if 9 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 8 EQU %ERRORLEVEL% (
   call :seafoam
) else if 7 EQU %ERRORLEVEL% (
   call :lgray
) else if 6 EQU %ERRORLEVEL% (
   call :gray
) else if 5 EQU %ERRORLEVEL% (
   call :win98
) else if 4 EQU %ERRORLEVEL% (
   call :win95
) else if 3 EQU %ERRORLEVEL% (
   call :95blue
) else if 2 EQU %ERRORLEVEL% (
   call :win2000
) else if 1 EQU %ERRORLEVEL% (
   call :win11
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:win11
echo User chose Win10/11 Dodger Blue

reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColor" /t REG_DWORD /d "0xffd77800" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColor" /t REG_DWORD /d "0xffd77800" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorizationColor" /t REG_DWORD /d "0xffd77800" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColor" /t REG_DWORD /d "0xffd77800" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColor" /t REG_DWORD /d "0xffd77800" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "ColorizationColor" /t REG_DWORD /d "0xffd77800" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentColor" /t REG_DWORD /d "0xffd77800" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "StartColor" /t REG_DWORD /d "0xffd77800" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorizationColor" /t REG_DWORD /d "0xffd77800" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentColor" /t REG_DWORD /d "0xffd77800" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartColor" /t REG_DWORD /d "0xffd77800" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ColorizationColor" /t REG_DWORD /d "0xffd77800" /f

rem # Start Menu / Taskbar
rem reg add "HKCU\Control Panel\Colors" /v "Window" /t REG_SZ /d "0 120 215" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xffd77800" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColorMenu" /t REG_DWORD /d "0xffd77800" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "StartColorMenu" /t REG_DWORD /d "0xffd77800" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartColorMenu" /t REG_DWORD /d "0xffd77800" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffd77800" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffd77800" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffd77800" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffd77800" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "0078d7ff0078d7ff0078d7ff0078d7ff0078d7ff0078d7ff0078d7ff0078d7ff" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentPalette" /t REG_BINARY /d "0078d7ff0078d7ff0078d7ff0078d7ff0078d7ff0078d7ff0078d7ff0078d7ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentPalette" /t REG_BINARY /d "0078d7ff0078d7ff0078d7ff0078d7ff0078d7ff0078d7ff0078d7ff0078d7ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentPalette" /t REG_BINARY /d "0078d7ff0078d7ff0078d7ff0078d7ff0078d7ff0078d7ff0078d7ff0078d7ff" /f

goto :end

:win2000
echo User chose Win2000/WinXP Steel Blue

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

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColorMenu" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "StartColorMenu" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartColorMenu" /t REG_DWORD /d "0xffa56e3a" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffa56e3a" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentPalette" /t REG_BINARY /d "3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentPalette" /t REG_BINARY /d "3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentPalette" /t REG_BINARY /d "3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff3a6ea5ff" /f

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

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColorMenu" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "StartColorMenu" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartColorMenu" /t REG_DWORD /d "0xffff0000" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffff0000" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentPalette" /t REG_BINARY /d "0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentPalette" /t REG_BINARY /d "0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentPalette" /t REG_BINARY /d "0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff0000ffff" /f

goto :end

:win95
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

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColorMenu" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "StartColorMenu" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartColorMenu" /t REG_DWORD /d "0xff800000" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff800000" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "000080ff000080ff000080ff000080ff000080ff000080ff000080ff000080ff" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentPalette" /t REG_BINARY /d "000080ff000080ff000080ff000080ff000080ff000080ff000080ff000080ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentPalette" /t REG_BINARY /d "000080ff000080ff000080ff000080ff000080ff000080ff000080ff000080ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentPalette" /t REG_BINARY /d "000080ff000080ff000080ff000080ff000080ff000080ff000080ff000080ff" /f

goto :end

:win98
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

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xff808000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColorMenu" /t REG_DWORD /d "0xff808000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "StartColorMenu" /t REG_DWORD /d "0xff808000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartColorMenu" /t REG_DWORD /d "0xff808000" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff808000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff808000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff808000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff808000" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "008080ff008080ff008080ff008080ff008080ff008080ff008080ff008080ff" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentPalette" /t REG_BINARY /d "008080ff008080ff008080ff008080ff008080ff008080ff008080ff008080ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentPalette" /t REG_BINARY /d "008080ff008080ff008080ff008080ff008080ff008080ff008080ff008080ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentPalette" /t REG_BINARY /d "008080ff008080ff008080ff008080ff008080ff008080ff008080ff008080ff" /f

goto :end

:seafoam
echo User chose Seafoam/Dark Turquoise

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

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xffc3b700" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColorMenu" /t REG_DWORD /d "0xffc3b700" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "StartColorMenu" /t REG_DWORD /d "0xffc3b700" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartColorMenu" /t REG_DWORD /d "0xffc3b700" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffc3b700" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffc3b700" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffc3b700" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffc3b700" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentPalette" /t REG_BINARY /d "00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentPalette" /t REG_BINARY /d "00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentPalette" /t REG_BINARY /d "00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff00b6c3ff" /f

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

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColorMenu" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "StartColorMenu" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartColorMenu" /t REG_DWORD /d "0xff808080" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff808080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarColorOverride" /t REG_DWORD /d "0xff808080" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "808080ff808080ff808080ff808080ff808080ff808080ff808080ff808080ff" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentPalette" /t REG_BINARY /d "808080ff808080ff808080ff808080ff808080ff808080ff808080ff808080ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentPalette" /t REG_BINARY /d "808080ff808080ff808080ff808080ff808080ff808080ff808080ff808080ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentPalette" /t REG_BINARY /d "808080ff808080ff808080ff808080ff808080ff808080ff808080ff808080ff" /f

goto :end

:lgray
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

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "StartColorMenu" /t REG_DWORD /d "0xffc0c0c0" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "StartColorMenu" /t REG_DWORD /d "0xffc0c0c0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "StartColorMenu" /t REG_DWORD /d "0xffc0c0c0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "StartColorMenu" /t REG_DWORD /d "0xffc0c0c0" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffc0c0c0" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffc0c0c0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffc0c0c0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarColorOverride" /t REG_DWORD /d "0xffc0c0c0" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentPalette" /t REG_BINARY /d "c0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ff" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentPalette" /t REG_BINARY /d "c0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentPalette" /t REG_BINARY /d "c0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ff" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentPalette" /t REG_BINARY /d "c0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ffc0c0c0ff" /f

goto :end

:end

echo.
echo Title Bar Color
echo.
echo 1. Win2000/WinXP Steel Blue
echo 2. Win10/11 Dodger Blue
echo 3. Win95 Navy
echo 4. Win95 Blue
echo C. Cancel
echo.
choice /c 1234C /m "Choose an option :"

if 5 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 4 EQU %ERRORLEVEL% (
   call :blue95
) else if 3 EQU %ERRORLEVEL% (
   call :navy95
) else if 2 EQU %ERRORLEVEL% (
   call :dodger
) else if 1 EQU %ERRORLEVEL% (
   call :lightb
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:lightb
echo User chose Win2000/WinXP Steel Blue

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColorMenu" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentColorMenu" /t REG_DWORD /d "0xffa56e3a" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentColorMenu" /t REG_DWORD /d "0xffa56e3a" /f

goto :end

:dodger
echo User chose Win10/11 Dodger Blue

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d "0xffd77800" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColorMenu" /t REG_DWORD /d "0xffd77800" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentColorMenu" /t REG_DWORD /d "0xffd77800" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentColorMenu" /t REG_DWORD /d "0xffd77800" /f

goto :end

:blue95
echo User chose Win95 Blue

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColorMenu" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentColorMenu" /t REG_DWORD /d "0xffff0000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentColorMenu" /t REG_DWORD /d "0xffff0000" /f

goto :end

:navy95
echo User chose Win95 Navy

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Accent" /v "AccentColorMenu" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "AccentColorMenu" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AccentColorMenu" /t REG_DWORD /d "0xff800000" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "AccentColorMenu" /t REG_DWORD /d "0xff800000" /f

goto :end

:end

echo.
echo High Contrast Theme Silver Gray Start Menu / Taskbar
echo.
echo 1. Silver Gray Start Menu / Taskbar for High Contrast Theme
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
echo User chose Silver Gray Start Menu / Taskbar for High Contrast Theme

reg add "HKCU\Control Panel\Colors" /v "Window" /t REG_SZ /d "192 192 192" /f

goto :end

:accent
echo User chose Default for Accent Theme

reg add "HKCU\Control Panel\Colors" /v "Window" /t REG_SZ /d "255 255 255" /f

goto :end

:end

PAUSE