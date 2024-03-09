REM Deletes tmp, cache, prefetch, last known good configuration files, live kernel reports, and Windows.old
REM Dont delete "rescache" folder

rmdir /s /q "C:\Windows\Temp"
rmdir /s /q "%USERPROFILE%\AppData\Local\Temp"
DEL /F /S /Q /A %LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db

rmdir /s /q "C:\Windows\LastGood"
rmdir /s /q "C:\Windows\LastGood.tmp"
rmdir /s /q "C:\Windows\LiveKernelReports"
rmdir /s /q "C:\Windows\Prefetch"

rmdir /s /q "C:\Windows.old"

PAUSE