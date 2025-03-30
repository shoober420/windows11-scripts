rem # Theme custom settings

rem # !!! WARNING !!!

rem # Make sure all settings are desired before applying

rem # !!! WARNING !!!

PAUSE

rem # Windows Standard Mouse Cursor (None)
reg add "HKCU\Control Panel\Cursors" /ve /d "" /f

rem # Windows 98 Recycle Bin
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" /ve /d "%SystemRoot%\System32\SHELL32.dll,101" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" /v "empty" /t REG_EXPAND_SZ /d "%SystemRoot%\System32\SHELL32.dll,101" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" /v "full" /t REG_EXPAND_SZ /d "%SystemRoot%\System32\SHELL32.dll,102" /f

rem # Windows 95 similar My Computer icon
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\DefaultIcon" /ve /d "%SystemRoot%\System32\pifmgr.dll,11" /f

rem # Windows 95 similar desktop Control Panel icon
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}\DefaultIcon" /ve /d "%SystemRoot%\System32\shell32.dll,90" /f

rem # Rename "This PC" to "My Computer"
rem # My Computer is one line when using 4:3 resolutions
rem # My Computer is two lines when using 16:9 resolutions
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /ve /d "My Computer" /f

rem # Rename User Folder to "My Documents"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{59031A47-3F72-44A7-89C5-5595FE6B30EE}" /ve /d "My Documents" /f

rem # Enable Dark mode
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "AppsUseLightTheme" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorPrevalence" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "SystemUsesLightTheme" /t REG_DWORD /d "0" /f

rem # Background Type
rem # 0 = Picture / 1 = Solid Color / 2 = Slideshow / 3 = Windows Spotlight
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Wallpapers" /v "BackgroundType" /t REG_DWORD /d "1" /f

rem # Disable Desktop Spotlight
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\DesktopSpotlight\Settings" /v "EnabledState" /t REG_DWORD /d "0" /f

rem # Transparency Effects
rem # 1 = Enabled \ 0 = Disabled
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d "0" /f

rem # Show accent color on Start and Taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "ColorPrevalence" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "ColorPrevalence" /t REG_DWORD /d "0" /f

rem # Show accent color on title bars and window borders
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableWindowColorization" /t REG_DWORD /d "0" /f

rem # Taskbar Alignment / 0 - Left / 1 - Center
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAl" /t REG_DWORD /d "0" /f

rem # Taskbar size 
rem # 0 = Small / 1 = Default / 2 = Large
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSi" /t REG_DWORD /d "0" /f

rem # Small Taskbar icons
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSmallIcons" /t REG_DWORD /d "1" /f

rem # 0 - Disable Show Desktop on right side of Taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSd" /t REG_DWORD /d "0" /f

rem # Unlock Taskbar to move on sides or top of screen
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarSizeMove" /t REG_DWORD /d "0" /f

rem # Taskbar Uncombined and Unlocked
rem # To always combine, hide labels (default): TaskbarGlomLevel = 0
rem # Combine when taskbar is full/Show labels: TaskbarGlomLevel = 1
rem # Never combine/Show labels: TaskbarGlomLevel = 2
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarGlomLevel" /t REG_DWORD /d "2" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "MMTaskbarGlomLevel" /t REG_DWORD /d "2" /f

rem # 1 - Always show all icons and notifications on the taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer" /v "EnableAutoTray" /t REG_DWORD /d "0" /f

rem # Classic Taskbar
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Shell\Update\Packages" /v "UndockingDisabled" /t REG_DWORD /d "1" /f

rem # Always show all icons in the notification area
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoAutoTrayNotify" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "EnableAutoTray" /t REG_DWORD /d "0" /f

rem # Prevent grouping of taskbar items
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoTaskGrouping" /t REG_DWORD /d "1" /f

rem # Do not display any custom toolbars in the taskbar
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoToolbarsOnTaskbar" /t REG_DWORD /d "1" /f

rem # Remove common program groups from Start Menu
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoCommonGroups" /t REG_DWORD /d "1" /f

rem # Remove pinned programs list from the Start Menu
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer" /v "NoStartMenuPinnedList" /t REG_DWORD /d "1" /f

rem # Enable or Disable Pinned Apps on Taskbar
reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "TaskbarNoPinnedList" /t REG_DWORD /d "1" /f

rem # Do not allow pinning Store app to the Taskbar
 reg add "HKCU\Software\Policies\Microsoft\Windows\Explorer" /v "NoPinningStoreToTaskbar" /t REG_DWORD /d "1" /f

rem # https://www.autohotkey.com/docs/v1/misc/CLSID-List.htm

rem # Show This PC (formerly My Computer or Computer) desktop icon
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /t REG_DWORD /d "0" /f

rem # Show User Folder desktop icon
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{59031a47-3f72-44a7-89c5-5595fe6b30ee}" /t REG_DWORD /d "0" /f

rem # Show Recycle Bin desktop icon
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{645FF040-5081-101B-9F08-00AA002F954E}" /t REG_DWORD /d "0" /f

rem # Show Control Panel desktop icon
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}" /t REG_DWORD /d "0" /f

rem # Show Network deskop icon
rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" /t REG_DWORD /d "1" /f
rem reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" /t REG_DWORD /d "1" /f
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\NewStartPanel" /v "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" /t REG_DWORD /d "1" /f
rem reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\HideDesktopIcons\ClassicStartMenu" /v "{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" /t REG_DWORD /d "1" /f

rem # Disable Theme Changes
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes" /v "ThemeChangesDesktopIcons" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes" /v "ThemeChangesMousePointers" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes" /v "WallpaperSetFromTheme" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes" /v "ColorSetFromTheme" /t REG_DWORD /d "0" /f

PAUSE