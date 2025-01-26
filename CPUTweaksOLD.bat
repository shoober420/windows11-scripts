rem # CPU Tweak script (OLD)

rem # Disable HyperThreading in BIOS, lowers FPS

rem # Query CPU Core and Thread count
rem # Get-WmiObject –class Win32_processor | ft NumberOfCores,NumberOfLogicalProcessors

rem # https://martin77s.wordpress.com/2010/04/05/performance-tuning-your-windows-server-part-3/
rem # https://www.thewindowsclub.com/improve-network-speed-using-smb-compression
rem # https://james-rankin.com/features/the-ultimate-guide-to-windows-logon-optimizations-part-5/
rem # https://www.wilderssecurity.com/threads/increase-number-of-threads-per-process.317532/

rem # AdditionalCriticalWorkerThreads value increases the number of critical worker threads created for a specified work queue
rem # By increasing the value of this one, you can get more additional worker threads which will allow for more queued I/O in the storage subsystem
rem # Allow more I/O to queue in the storage subsystem

rem # OLD METHOD: ONLY FOR TESTING
rem # CPUTweaks.bat IS RECOMMENDED

PAUSE


PAUSE

@echo off

echo.
echo 1. 4 threads
echo 2. 8 threads
echo 3. 12 threads
echo 4. 16 threads
echo 5. 32 threads
echo C. Cancel
echo.
choice /c 12345C /m "Choose an option :"

 if 6 EQU %ERRORLEVEL% (
    echo User chose to cancel.
) else if 5 EQU %ERRORLEVEL% (
   call :32threads
) else if 4 EQU %ERRORLEVEL% (
   call :16threads
) else if 3 EQU %ERRORLEVEL% (
   call :12threads
) else if 2 EQU %ERRORLEVEL% (
   call :8threads
) else if 1 EQU %ERRORLEVEL% (
   call :4threads
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:4threads
echo User chose 4 threads
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "AdditionalCriticalWorkerThreads" /t REG_DWORD /d "2" /f
goto :end

:8threads
echo User chose 8 threads
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "AdditionalCriticalWorkerThreads" /t REG_DWORD /d "4" /f
goto :end

:12threads
echo User chose 12 threads
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "AdditionalCriticalWorkerThreads" /t REG_DWORD /d "6" /f
goto :end

:16threads
echo User chose 16 threads
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "AdditionalCriticalWorkerThreads" /t REG_DWORD /d "8" /f
goto :end

:32threads
echo User chose 32 threads
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "AdditionalCriticalWorkerThreads" /t REG_DWORD /d "16" /f
goto :end

:end



rem # Delayed Worker Threads - Threads in this queue have a lower priority and therefore a higher latency because they must compete with other processing for CPU time

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "AdditionalDelayedWorkerThreads" /t REG_DWORD /d "0" /f

PAUSE

rem # rem # https://www.overclock.net/threads/additionalcriticalworkerthreads.1254416/
rem # Im not entirely sure if this logic is correct, as most recommended values are 16+ from various sources
rem # This thread is from 2012, and information could be obsolete

rem # Set AdditionalCriticalWorkerThreads to match your CPU thread count

rem # 4 threads = 1 default critical thread , 2 additional critical threads and 1 thread left for background processes / AdditionalCriticalWorkerThreads = 2

rem # 8 threads = 2 default critical thread , 4 additional critical threads and 2 thread left for background processes / AdditionalCriticalWorkerThreads = 4

rem # 12 threads = 3 default critical thread , 6 additional critical threads and 3 thread left for background processes / AdditionalCriticalWorkerThreads = 6

rem # 16 threads = 4 default critical thread , 8 additional critical threads and 4 thread left for background processes / AdditionalCriticalWorkerThreads = 8

rem # 32 threads = 8 default critical thread , 16 additional critical threads and 8 thread left for background processes / AdditionalCriticalWorkerThreads = 16
