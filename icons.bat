rem Uses custom icons for desktop and UI

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" /v "empty" /t REG_EXPAND_SZ /d "%SystemRoot%\System32\shell32.dll,101" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" /v "full" /t REG_EXPAND_SZ /d "%SystemRoot%\System32\shell32.dll,102" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{645FF040-5081-101B-9F08-00AA002F954E}\DefaultIcon" /ve /d "%SystemRoot%\System32\shell32.dll,102" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}" /ve /d "My Computer" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{20D04FE0-3AEA-1069-A2D8-08002B30309D}\DefaultIcon" /ve /d "%USERPROFILE%\Downloads\MyComputerIcon.ico" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{59031A47-3F72-44A7-89C5-5595FE6B30EE}" /ve /d "My Documents" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{59031A47-3F72-44A7-89C5-5595FE6B30EE}\DefaultIcon" /ve /d "%USERPROFILE%\Downloads\MyDocumentsIcon.ico" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}" /ve /d "Network Neighborhood" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{F02C1A0D-BE21-4350-88B0-7367FC96EF3C}\DefaultIcon" /ve /d "%USERPROFILE%\Downloads\NetworkNeighborhoodIcon.ico" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\CLSID\{5399E694-6CE5-4D6C-8FCE-1D8870FDCBA0}\DefaultIcon" /ve /d "%USERPROFILE%\Downloads\ControlPanelIcon.ico" /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f
reg delete "HKLM\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\{0DB7E03F-FC29-4DC6-9020-FF41B59E513A}" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v "3" /t REG_SZ /d "%USERPROFILE%\Downloads\FolderIcon.ico" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" /v "4" /t REG_SZ /d "%USERPROFILE%\Downloads\FolderIcon.ico" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\DriveIcons\C\DefaultIcon" /ve /d "%USERPROFILE%\Downloads\HDIcon.ico" /f

reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes" /v "CurrentTheme" /t REG_SZ /d "%USERPROFILE%\Downloads\FuckingWindows98.deskthemepack" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes" /v "ThemeMRU" /t REG_SZ /d "%USERPROFILE%\Downloads\FuckingWindows98.deskthemepack" /f

ECHO Yes | reg add "HKCR\Applications\notepad++.exe\DefaultIcon" /ve /d "%USERPROFILE%\Downloads\TextFileIcon.ico"
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.txt\UserChoice" /v "ProgId" /t REG_SZ /d "Applications\notepad++.exe" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.cfg\UserChoice" /v "ProgId" /t REG_SZ /d "Applications\notepad++.exe" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.ini\UserChoice" /v "ProgId" /t REG_SZ /d "Applications\notepad++.exe" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\FileExts\.log\UserChoice" /v "ProgId" /t REG_SZ /d "Applications\notepad++.exe" /f
