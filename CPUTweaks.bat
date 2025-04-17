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







rem # CPU Tweak script (OLD)
rem # TESTING ONLY

rem @echo off

rem echo.
rem echo 1. 4 threads
rem echo 2. 8 threads
rem echo 3. 12 threads
rem echo 4. 16 threads
rem echo 5. 32 threads
rem echo C. Cancel
rem echo.
rem choice /c 12345C /m "Choose an option :"

rem if 6 EQU %ERRORLEVEL% (
rem   echo User chose to cancel.
rem ) else if 5 EQU %ERRORLEVEL% (
rem   call :32threads
rem ) else if 4 EQU %ERRORLEVEL% (
rem   call :16threads
rem ) else if 3 EQU %ERRORLEVEL% (
rem   call :12threads
rem ) else if 2 EQU %ERRORLEVEL% (
rem   call :8threads
rem ) else if 1 EQU %ERRORLEVEL% (
rem   call :4threads
rem ) else if 0 EQU %ERRORLEVEL% (
rem   echo User bailed out.
rem )

rem goto :eof

rem :4threads
rem echo User chose 4 threads
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "AdditionalCriticalWorkerThreads" /t REG_DWORD /d "2" /f
rem goto :end

rem :8threads
rem echo User chose 8 threads
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "AdditionalCriticalWorkerThreads" /t REG_DWORD /d "4" /f
rem goto :end

rem :12threads
rem echo User chose 12 threads
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "AdditionalCriticalWorkerThreads" /t REG_DWORD /d "6" /f
rem goto :end

rem :16threads
rem echo User chose 16 threads
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "AdditionalCriticalWorkerThreads" /t REG_DWORD /d "8" /f
rem goto :end

rem :32threads
rem echo User chose 32 threads
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "AdditionalCriticalWorkerThreads" /t REG_DWORD /d "16" /f
rem goto :end

rem :end



rem # Delayed Worker Threads
rem # Threads in this queue have a lower priority and therefore a higher latency because they must compete with other processing for CPU time

rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "AdditionalDelayedWorkerThreads" /t REG_DWORD /d "0" /f



rem # rem # https://www.overclock.net/threads/additionalcriticalworkerthreads.1254416/
rem # Im not entirely sure if this logic is correct, as most recommended values are 16+ from various sources
rem # This thread is from 2012, and information could be obsolete

rem # Set AdditionalCriticalWorkerThreads to match your CPU thread count

rem # 4 threads = 1 default critical thread , 2 additional critical threads and 1 thread left for background processes / AdditionalCriticalWorkerThreads = 2

rem # 8 threads = 2 default critical thread , 4 additional critical threads and 2 thread left for background processes / AdditionalCriticalWorkerThreads = 4

rem # 12 threads = 3 default critical thread , 6 additional critical threads and 3 thread left for background processes / AdditionalCriticalWorkerThreads = 6

rem # 16 threads = 4 default critical thread , 8 additional critical threads and 4 thread left for background processes / AdditionalCriticalWorkerThreads = 8

rem # 32 threads = 8 default critical thread , 16 additional critical threads and 8 thread left for background processes / AdditionalCriticalWorkerThreads = 16