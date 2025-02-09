rem # Deletes various logs, tmp, cache, prefetch, last known good configuration files, live kernel reports, and Windows.old
rem # Dont delete "rescache" folder

rmdir /s /q "C:\Windows\Temp"
rmdir /s /q "%USERPROFILE%\AppData\Local\Temp"

# Deletes SuperFetch files
rmdir /s /q "C:\Windows\Prefetch"

del "%USERPROFILE%\AppData\Local\cache" /f /q /s
del "%USERPROFILE%\AppData\Local\OneDrive\cache" /f /q /s
del "%USERPROFILE%\AppData\Local\CrashDumps" /f /q /s
del "%APPDATA%\Microsoft\Windows\Recent" /f /q /s
del "C:\Windows\Logs\MeasuredBoot" /f /q /s
del "C:\ProgramData\Microsoft\Windows\WER" /f /q /s
del "%USERPROFILE%\AppData\Local\Microsoft\Edge\User Data\Default\Cache" /f /q /s
del "%USERPROFILE%\AppData\Local\Microsoft\Edge\User Data\Default\DawnCache" /f /q /s
del "%USERPROFILE%\AppData\Local\Microsoft\Edge\User Data\Default\GPUCache" /f /q /s
del "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\Cache" /f /q /s
del "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\DawnCache" /f /q /s
del "%USERPROFILE%\AppData\Local\Google\Chrome\User Data\Default\GPUCache" /f /q /s
del "%USERPROFILE%\AppData\Local\Google\Chrome SxS\User Data\Default\Cache" /f /q /s
del "%USERPROFILE%\AppData\Local\Google\Chrome SxS\User Data\Default\DawnCache" /f /q /s
del "%USERPROFILE%\AppData\Local\Google\Chrome SxS\User Data\Default\GPUCache" /f /q /s
del "%USERPROFILE%\AppData\Local\Chromium\User Data\Default\Cache" /f /q /s
del "%USERPROFILE%\AppData\Local\Chromium\User Data\Default\GPUCache" /f /q /s
DEL /F /S /Q /A %LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db
del "C:\PerfLogs" /f /q /s

rmdir /s /q "C:\Windows\LastGood"
rmdir /s /q "C:\Windows\LastGood.tmp"
rmdir /s /q "C:\Windows\LiveKernelReports"

takeown /s %computername% /u %username% /f "C:\Windows.old"
icacls "C:\Windows.old" /grant:r %username%:F
rmdir /s /q "C:\Windows.old"
del "C:\Windows.old" /f /q /s

DEL /F /S /Q /A "C:\pagefile.sys"
DEL /F /S /Q /A "C:\swapfile.sys"

rem # Delete Direct3D cache
del "%USERPROFILE%\AppData\Local\D3DSCache" /f /q /s

rem # Deletes NVIDIA shader caches
rmdir /s /q "%LocalAppData%\NVIDIA\DXCache"
del "%USERPROFILE%\AppData\LocalLow\NVIDIA\PerDriverVersion\DXCache" /f /q /s
rmdir /s /q "%LocalAppData%\NVIDIA\GLCache"
del "%USERPROFILE%\AppData\LocalLow\NVIDIA\PerDriverVersion\GLCache" /f /q /s
del "%USERPROFILE%\AppData\Roaming\NVIDIA\ComputeCache" /f /q /s

rem # Delete Steam htmlcache
del "%USERPROFILE%\AppData\Local\Steam\htmlcache" /f /q /s

rem # Clear Windows Run MRU & typedpaths
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\RunMRU" /va /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\TypedPaths" /va /f

rem # Clear Most Recent Application's Use of DirectX
reg delete "HKCU\Software\Microsoft\Direct3D\MostRecentApplication" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\Direct3D\MostRecentApplication" /va /f

rem # Clear windows media player recent files and urls
reg delete "HKCU\Software\Microsoft\MediaPlayer\Player\RecentFileList" /va /f
reg delete "HKCU\Software\Microsoft\MediaPlayer\Player\RecentURLList" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\MediaPlayer\Player\RecentFileList" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\MediaPlayer\Player\RecentURLList" /va /f

rem # Clear list of Recent Files Opened, by Filetype
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /va /f
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RecentDocs" /va /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\OpenSaveMRU" /va /f

rem # Clear Windows Search Assistant history
reg delete "HKCU\Software\Microsoft\Search Assistant\ACMru" /va /f

rem # Clear Adobe Media Browser MRU
reg delete "HKCU\Software\Adobe\MediaBrowser\MRU" /va /f

rem # Clear MSPaint MRU
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Paint\Recent File List" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Paint\Recent File List" /va /f

rem # Clear Wordpad MRU
reg delete "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Wordpad\Recent File List" /va /f
        
rem # Clear Map Network Drive MRU MRU
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Map Network Drive MRU" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Map Network Drive MRU" /va /f

rem # Clear list of recent programs opened
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRU" /va /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\ComDlg32\LastVisitedPidlMRULegacy" /va /f

rem # Clear regedit last key
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Regedit" /va /f
        
rem # Clear regedit favorites
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Applets\Regedit\Favorites" /va /f
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Applets\Regedit\Favorites" /va /f

rem # Clear Distributed Transaction Coordinator log
del "C:\Windows\DtcInstall.log" /f /q /s

rem # Clear Optional Component Manager and COM+ components logs
del "C:\Windows\comsetup.log" /f /q /s

rem # Clear Pending File Rename Operations logs
del "C:\Windows\PFRO.log" /f /q /s

rem # Clear Windows Deployment Upgrade Process Logs
del "C:\Windows\setupact.log" /f /q /s
del "C:\Windows\setuperr.log" /f /q /s

rem # Clear Windows Setup Logs
del "C:\Windows\setupapi.log" /f /q /s
del "C:\Windows\Panther\*" /f /q /s
del "C:\Windows\INF\setupapi.*" /f /q /s

rem # Clear Windows System Assessment Tool logs
del "C:\Windows\Performance\WinSAT\winsat.log" /f /q /s

rem # Clear Password change events and debug logs
del "C:\Windows\debug\*.log" /f /q /s

rem # Clear user web cache database
del "%LOCALAPPDATA%\Microsoft\Windows\WebCache\*" /f /q /s

rem # Clear system temp folder when noone is logged in
del "C:\Windows\ServiceProfiles\LocalService\AppData\Local\Temp" /f /q /s

rem # Clear DISM (Deployment Image Servicing and Management) Logs and Windows\Logs folder
del "C:\Windows\Logs" /f /q /s

rem # Clear Cryptographic Services Traces
del "C:\Windows\System32\catroot2\dberr.txt" /f /q /s
del "C:\Windows\System32\catroot2.log" /f /q /s
del "C:\Windows\System32\catroot2.jrs" /f /q /s
del "C:\Windows\System32\catroot2.edb" /f /q /s
del "C:\Windows\System32\catroot2.chk" /f /q /s

del /s /f /q c:\windows\temp.
del /s /f /q C:\WINDOWS\Prefetch
del /s /f /q %temp%.
del /s /f /q %systemdrive%\*.tmp
del /s /f /q %systemdrive%\*._mp
del /s /f /q %systemdrive%\*.log
del /s /f /q %systemdrive%\*.gid
del /s /f /q %systemdrive%\*.chk
del /s /f /q %systemdrive%\*.old
del /s /f /q %systemdrive%\recycled\*.*
del /s /f /q %systemdrive%\$Recycle.Bin\*.*
del /s /f /q %windir%\*.bak
del /s /f /q %windir%\prefetch\*.*
del /s /f /q %LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db
del /s /f /q %LocalAppData%\Microsoft\Windows\Explorer\*.db
del /f /q %SystemRoot%\Logs\CBS\CBS.log
del /f /q %SystemRoot%\Logs\DISM\DISM.log
deltree /y c:\windows\tempor~1
deltree /y c:\windows\temp
deltree /y c:\windows\tmp
deltree /y c:\windows\ff*.tmp
deltree /y c:\windows\history
deltree /y c:\windows\cookies
deltree /y c:\windows\recent
deltree /y c:\windows\spool\printers

PAUSE
