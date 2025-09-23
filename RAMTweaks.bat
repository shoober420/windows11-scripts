rem # RAM Tweaks

rem # https://www.elevenforum.com/members/garlin.5387/
rem # https://www.elevenforum.com/t/gpu-tweaks-batch-script.30134/post-521530

rem # Pagefile Size in MB 
rem # 8GB = 8192 / 16GB = 16384 / 32GB = 32768 / 64GB = 65536

rem # InitialSize=65536,MaximumSize=65536

rem # Disable Page File
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagingFiles" /t REG_MULTI_SZ /d "c:\pagefile.sys 0 0" /f

if not exist C:\Windows\System32\wbem\WMIC.exe (
    echo Installing WMIC...
    DISM /Online /Add-Capability /CapabilityName:WMIC~~~~
    echo Done.
)

rem # Sets SvcHostSplitThresholdInKB, IoPageLockLimit, CacheUnmapBehindLengthInMB, and ModifiedWriteMaximum according to RAM size

@echo off

@echo off

echo.
echo 1. 4GB RAM
echo 2. 8GB RAM
echo 3. 16GB RAM
echo 4. 32GB RAM
echo 5. 48GB RAM
echo 6. 64GB RAM
echo 7. SKIP
echo C. Cancel
echo.
choice /c 12345678C /m "Choose an option :"

if 8 EQU %ERRORLEVEL% (
   echo User chose to cancel.
) else if 7 EQU %ERRORLEVEL% (
   call :zcyb
) else if 6 EQU %ERRORLEVEL% (
   call :64gb
) else if 5 EQU %ERRORLEVEL% (
   call :48gb
) else if 4 EQU %ERRORLEVEL% (
   call :32gb
) else if 3 EQU %ERRORLEVEL% (
   call :16gb
) else if 2 EQU %ERRORLEVEL% (
   call :8gb
) else if 1 EQU %ERRORLEVEL% (
   call :4gb
) else if 0 EQU %ERRORLEVEL% (
   echo User bailed out.
)

goto :eof

:4gb
echo User chose 4GB RAM

rem wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
rem wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=8192,MaximumSize=8192

reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "400000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "400000" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /t REG_DWORD /d "0x00100000" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "CacheUnmapBehindLengthInMB" /t REG_DWORD /d "0x00000100" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ModifiedWriteMaximum" /t REG_DWORD /d "0x00000020" /f

goto :end

:8gb
echo User chose 8GB RAM

rem wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
rem wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=8192,MaximumSize=8192

reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "800000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "800000" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /t REG_DWORD /d "0x00200000" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "CacheUnmapBehindLengthInMB" /t REG_DWORD /d "0x00000200" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ModifiedWriteMaximum" /t REG_DWORD /d "0x00000040" /f

goto :end

:16gb
echo User chose 16GB RAM

rem wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
rem wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=16384,MaximumSize=16384

reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "1000000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "1000000" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /t REG_DWORD /d "0x00400000" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "CacheUnmapBehindLengthInMB" /t REG_DWORD /d "0x00000400" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ModifiedWriteMaximum" /t REG_DWORD /d "0x00000080" /f

goto :end

:32gb
echo User chose 32GB RAM

rem wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
rem wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=32768,MaximumSize=32768

reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "2000000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "2000000" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /t REG_DWORD /d "0x00800000" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "CacheUnmapBehindLengthInMB" /t REG_DWORD /d "0x00000800" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ModifiedWriteMaximum" /t REG_DWORD /d "0x00000160" /f

goto :end

:48gb
echo User chose 48GB RAM

rem wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
rem wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=8192,MaximumSize=8192

reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "3000000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "3000000" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /t REG_DWORD /d "0x00900000" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "CacheUnmapBehindLengthInMB" /t REG_DWORD /d "0x00001200" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ModifiedWriteMaximum" /t REG_DWORD /d "0x00000240" /f

goto :end

:64gb
echo User chose 64GB RAM

rem wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
rem wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=65536,MaximumSize=65536

reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "4000000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "4000000" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /t REG_DWORD /d "0x01000000" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "CacheUnmapBehindLengthInMB" /t REG_DWORD /d "0x00001600" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ModifiedWriteMaximum" /t REG_DWORD /d "0x00000320" /f

goto :end

:end



rem # https://msfn.org/board/topic/25684-registry-myths-1-iopagelocklimit/
rem # https://www.reddit.com/r/techsupport/comments/s92o06/paged_pool_and_non_paged_pool_is_very_high/
rem # https://learn.microsoft.com/en-us/troubleshoot/windows-server/performance/unable-allocate-memory-system-paged-pool
rem # https://support.arcserve.com/s/article/Tuning-Guide-for-StorageCraft-Software-on-Servers?language=de
rem # https://sites.google.com/site/tweakradje/windows/windows-tweaking
rem # https://github.com/mirror/reactos/blob/master/reactos/ntoskrnl/mm/ARM3/mminit.c

rem # Page Table Entries amount
rem # 0 = System Default / Auto-Tuned
rem # alufena = 0x0000c000
rem # 0xffffffff = Maximize system pages
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SystemPages" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "NonPagedPoolQuota" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "NonPagedPoolSize" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "PagedPoolQuota" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "PagedPoolSize" /t REG_DWORD /d "0" /f

rem # alufena = 0x00000040 (64)
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "PoolUsageMaximum" /t REG_DWORD /d "0x00000040" /f

rem # USED FOR REMOTE DESKTOP SESSIONS
rem # alufena = 40 / 30
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "SessionPoolSize" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "SessionViewSize" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "DynamicMemory" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "EnforceWriteProtection" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "MakeLowMemory" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "SystemCacheLimit" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "SessionSpaceLimit" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "WriteWatch" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "SnapUnloads" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "MapAllocationFragment" /t REG_DWORD /d "0x00020000" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "Mirroring" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "DontVerifyRandomDrivers" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ControlSet001\Control\Session Manager\Memory Management" /v "EnableLowVaAccess" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "BoostCriticalThreads" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "CriticalThreadPriority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DedicatedGameCache" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisableDynamicMemoryAllocation" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisableKernelPaging" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingCombining" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisableRegistryPaging" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableHighPrecisionClockSync" /t REG_DWORD /d "1" /f

rem # Disable Hyper Threading Optimization
rem # Hyper Threading is bad for games
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableHyperThreadingOptimization" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "EnableLookasideLists" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ForceSingleCoreAffinityForCriticalThreads" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ProcessPrePage" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "RegistryProcessMemoryOptimization" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SystemPtesLimit" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "TimerBResolution" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "TimerMinResolution" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "TrackLockedPages" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "TrackPtes" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SchedulerQuantum" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SimulateCommitSavings" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PreferExternalManifest" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SwapfileControl" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ThreadSchedulingMode" /t REG_DWORD /d "1" /f



rem # Disable Memory Compression
PowerShell -Command "Disable-MMAgent -MemoryCompression"

rem # Disable Page Combining
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePageCombining" /t REG_DWORD /d "1" /f

PowerShell -Command "Disable-MMAgent -PageCombining"

PAUSE



rem # SvcHostSplitThresholdInKB value is amount of RAM in KiloBytes (KB)
rem # Example math formula: 8 GB = 8x1024 MB = 8x1024x1024 KB = 8388608 KB
rem # 8GB = 8388608 (800000) / 16GB = 16777216 (1000000) / 32GB = 33554432 (2000000) / 64GB = 67108864 (4000000)

rem # IOPageLockLimit will limit RAM to use certain tasks
rem # Example math formula: 8 GB = 8x1024 MB = 8x1024x1024 KB = 8388608 KB
rem # 8GB = 8388608 (800000) / 16GB = 16777216 (1000000) / 32GB = 33554432 (2000000) / 64GB = 67108864 (4000000)

rem # CacheUnmapBehindLengthInMB trims your massive WorkingSet

rem # https://www.tenforums.com/performance-maintenance/189717-test-trim-workingset-ram.html

rem # https://www.i.u-tokyo.ac.jp/edu/training/ss/lecture/new-documents/Lectures/15-CacheManager/CacheManager.pdf

rem # CacheUnmapBehindLengthInMB=dword:00000100 ;256MB = 4GB RAM / 512MB = 8GB RAM / 1024MB = 16GB RAM / 2048MB = 32GB RAM / 4096MB = 64GB RAM
rem # dword:00000100 = 256MB = 4GB RAM / dword:00000200 = 512MB = 8GB RAM / dword:00000300 = 768MB = 12GB RAM / dword:00000400 = 1024MB = 16GB RAM / dword:00000800 = 2048MB = 32GB RAM / dword:00001600 = 4096MB = 64GB RAM


rem # ModifiedWriteMaximum=dword:00000020 ;32MB = 4GB RAM / 64MB = 8GB RAM / 128MB = 16GB RAM / 256MB = 32GB RAM / 512MB = 64GB RAM

rem # dword:00000020 ;32MB = 4GB RAM / dword:00000040 ;64MB = 8GB RAM / dword:00000060 ;96MB = 12GB RAM / dword:00000080 ;128MB = 16GB RAM / dword:00000160 ;256MB = 32GB RAM / dword:00000320 ;512MB = 64GB RAM
