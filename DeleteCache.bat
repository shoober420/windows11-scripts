rem # Deletes tmp, cache, prefetch, last known good configuration files, live kernel reports, and Windows.old
rem # Dont delete "rescache" folder

rmdir /s /q "C:\Windows\Temp"
rmdir /s /q "%USERPROFILE%\AppData\Local\Temp"
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

rmdir /s /q "C:\Windows\LastGood"
rmdir /s /q "C:\Windows\LastGood.tmp"
rmdir /s /q "C:\Windows\LiveKernelReports"
rmdir /s /q "C:\Windows\Prefetch"

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

PAUSE
