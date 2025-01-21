rem # !!! WARNING !!!
rem # ADJUST SETTINGS TO CORRESPOND WITH YOUR HARDWARE BEFORE RUNNING
rem # !!! WARNING !!!

rem # Disable HyperThreading in BIOS, lowers FPS

rem # Query CPU Core and Thread count
rem # Get-WmiObject –class Win32_processor | ft NumberOfCores,NumberOfLogicalProcessors

PAUSE

rem # https://www.overclock.net/threads/additionalcriticalworkerthreads.1254416/
rem # https://martin77s.wordpress.com/2010/04/05/performance-tuning-your-windows-server-part-3/
rem # https://www.wilderssecurity.com/threads/increase-number-of-threads-per-process.317532/
rem # 4 threads = 1 default critical thread , 2 additional critical threads and 1 thread left for background processes / AdditionalCriticalWorkerThreads = 2
rem # 8 threads = 2 default critical thread , 4 additional critical threads and 2 thread left for background processes / AdditionalCriticalWorkerThreads = 4
rem # 12 threads = 3 default critical thread , 6 additional critical threads and 3 thread left for background processes / AdditionalCriticalWorkerThreads = 6
rem # 16 threads = 4 default critical thread , 8 additional critical threads and 4 thread left for background processes / AdditionalCriticalWorkerThreads = 8
rem # 32 threads = 8 default critical thread , 16 additional critical threads and 8 thread left for background processes / AdditionalCriticalWorkerThreads = 16

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "AdditionalCriticalWorkerThreads" /t REG_DWORD /d "4" /f

rem # Delayed Worker Threads - Threads in this queue have a lower priority and therefore a higher latency because they must compete with other processing for CPU time

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "AdditionalDelayedWorkerThreads" /t REG_DWORD /d "0" /f

PAUSE
