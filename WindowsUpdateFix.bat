REM Fix Windows Update errors and bugs
REM Deletes Windows Update cache

del "%ALLUSERSPROFILE%\Application Data\Microsoft\Network\Downloader\qmgr*.dat"
rmdir %systemroot%\SoftwareDistribution /S /Q
rmdir %systemroot%\system32\catroot2 /S /Q
ren c:\windows\winsxs\pending.xml pending.old
bitsadmin.exe /reset /allusers

PAUSE
