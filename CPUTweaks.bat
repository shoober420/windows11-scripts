rem # CPU Tweak script

rem # Disable HyperThreading in BIOS, lowers FPS

rem # Query CPU Core and Thread count
rem # Get-WmiObject –class Win32_processor | ft NumberOfCores,NumberOfLogicalProcessors

rem # https://martin77s.wordpress.com/2010/04/05/performance-tuning-your-windows-server-part-3/
rem # https://www.thewindowsclub.com/improve-network-speed-using-smb-compression
rem # https://james-rankin.com/features/the-ultimate-guide-to-windows-logon-optimizations-part-5/
rem # https://www.wilderssecurity.com/threads/increase-number-of-threads-per-process.317532/
rem # rem # https://notes.ponderworthy.com/additional-critical-worker-threads-in-windows-speed-tweak

rem # AdditionalCriticalWorkerThreads value increases the number of critical worker threads created for a specified work queue

rem # By increasing the value of this one, you can get more additional worker threads which will allow for more queued I/O in the storage subsystem

rem # Allow more I/O to queue in the storage subsystem

rem # Value is determined by RAM size NOT thread or core count

PAUSE

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "AdditionalCriticalWorkerThreads" /t REG_DWORD /d "64" /f

rem # Delayed Worker Threads

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "AdditionalDelayedWorkerThreads" /t REG_DWORD /d "64" /f

PAUSE
