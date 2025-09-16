rem # Hard Drive tweaks

rem # https://www.youtube.com/watch?v=ajM7Nelf6Uc

rem # Enable TRIM for SSD / NVMe
fsutil behavior set DisableDeleteNotify 0



rem # Enable Write-Behind Caching
rem # Cache Power Protection
rem # 0 = Disabled / 1 = Enabled
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "UserWriteCacheSetting" /t REG_DWORD /d "1" /f

for /f "Delims=" %%k in ('reg query HKLM\SYSTEM\CurrentControlSet\Enum /f "{4d36e967-e325-11ce-bfc1-08002be10318}" /d /s^|Find "HKEY"') do (
  reg add "%%k\Device Parameters\Disk" /v "UserWriteCacheSetting" /t REG_DWORD /d "1" /f
)



rem # Low Latency Scaling Percentage
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "LowLatencyScalingPercentage" /t REG_DWORD /d "100" /f

rem # Disables power saving features

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SD\IdleState\1" /v "IdleExitEnergyMicroJoules" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SD\IdleState\1" /v "IdleExitLatencyMs" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SD\IdleState\1" /v "IdlePowerMw" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SD\IdleState\1" /v "IdleTimeLengthMs" /t REG_DWORD /d "4294967295" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\1" /v "IdleExitEnergyMicroJoules" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\1" /v "IdleExitLatencyMs" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\1" /v "IdlePowerMw" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\1" /v "IdleTimeLengthMs" /t REG_DWORD /d "4294967295" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\2" /v "IdleExitEnergyMicroJoules" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\2" /v "IdleExitLatencyMs" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\2" /v "IdlePowerMw" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\2" /v "IdleTimeLengthMs" /t REG_DWORD /d "4294967295" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\3" /v "IdleExitEnergyMicroJoules" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\3" /v "IdleExitLatencyMs" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\3" /v "IdlePowerMw" /t REG_DWORD /d "0" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\Storage\SSD\IdleState\3" /v "IdleTimeLengthMs" /t REG_DWORD /d "4294967295" /f

reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port0" /v "LPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port0" /v "LPMDSTATE" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port0" /v "DIPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port0" /v "HIPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port1" /v "LPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port1" /v "LPMDSTATE" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port1" /v "DIPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port1" /v "HIPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port2" /v "LPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port2" /v "LPMDSTATE" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port2" /v "DIPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port2" /v "HIPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port3" /v "LPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port3" /v "LPMDSTATE" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port3" /v "DIPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port3" /v "HIPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port4" /v "LPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port4" /v "LPMDSTATE" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port4" /v "DIPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port4" /v "HIPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port5" /v "LPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port5" /v "LPMDSTATE" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port5" /v "DIPM" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStor\Parameters\Port5" /v "HIPM" /t REG_DWORD /d "0" /f

rem # MSI mode support for IDE controller
for /f %%i in ('wmic path Win32_IDEController get PNPDeviceID ^| findstr /l "PCI\VEN_"') do (
	reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
	reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%i\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /t REG_DWORD /d "0" /f
)

rem # Disable disk power savings
for %%i in (EnableHIPM EnableDIPM EnableHDDParking) do for /f %%a in ('REG QUERY "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services" /s /f "%%i" ^| findstr "HKEY"') do REG ADD "%%a" /v "%%i" /t REG_DWORD /d 0 /f
)

for /f %%i in ('call "resources\smartctl.exe" --scan') do (
    call "resources\smartctl.exe" -s apm,off %%i
    call "resources\smartctl.exe" -s aam,off %%i
)

REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Storage" /v StorageD3InModernStandby /t REG_DWORD /d 0 /f
REG ADD "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\stornvme\Parameters\Device" /v IdlePowerMode /t REG_DWORD /d 0 /f

rem # Disable IoLatencyCap
for /F "eol=E" %%a in ('REG QUERY "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services" /S /F "IoLatencyCap"^| FINDSTR /V "IoLatencyCap"') DO (
        REG ADD "%%a" /v IoLatencyCap /t REG_DWORD /d "0" /f >NUL 2>&1
        for /F "tokens=*" %%z IN ("%%a") DO (
                SET STR=%%z
                SET STR=!STR:HKEY_LOCAL_MACHINE\System\CurrentControlSet\services\=!
                SET STR=!STR:\Parameters=!
        )
)

rem # Disable StorPort idle
for /F "tokens=*" %%a in ('REG QUERY "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Enum" /S /F "StorPort"^| FINDSTR /E "StorPort"') DO (
        REG ADD "%%a" /v EnableIdlePowerManagement /t REG_DWORD /d "0" /f >NUL 2>&1
        for /F "tokens=*" %%z IN ("%%a") DO (
                SET STR=%%z
                SET STR=!STR:HKEY_LOCAL_MACHINE\System\CurrentControlSet\Enum\=!
                SET STR=!STR:\Device Parameters\StorPort=!
        )
)

rem # Disable HIPM and DIPM
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStorA\Parameters\Device" /v Controller0Phy0HIPM /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStorA\Parameters\Device" /v Controller0Phy0DIPM /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStorA\Parameters\Device" /v Controller0Phy1HIPM /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\services\iaStorA\Parameters\Device" /v Controller0Phy1DIPM /t REG_DWORD /d 0 /f

for /F "eol=E" %%a in ('REG QUERY "HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services" /S /F "EnableHIPM"^| FINDSTR /V "EnableHIPM"') DO (
        REG ADD "%%a" /v EnableHIPM /t REG_DWORD /d 0 /f >NUL 2>&1
        REG ADD "%%a" /v EnableDIPM /t REG_DWORD /d 0 /f >NUL 2>&1
        for /F "tokens=*" %%z IN ("%%a") DO (
                SET STR=%%z
                SET STR=!STR:HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\=!
        )
)

rem # Disk Optimization
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Executive" /v "MaxTimeSeparationBeforeCorrect" /t REG_DWORD /d "1" /f

rem # NVMe Tweaks

rem # Disable NVME Throttling
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Classpnp" /v "NVMeDisablePerfThrottling" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "StorNVMeAllowZeroLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "ForceFlush" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "ImmediateData" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "ForceEagerWrites" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "StorNVMeAllowZeroLatency" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "ForceFlush" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "ImmediateData" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "ForceEagerWrites" /t REG_DWORD /d "1" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "QueueDepth" /t REG_DWORD /d "64" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "NvmeMaxReadSplit" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "NvmeMaxWriteSplit" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "MaxSegmentsPerCommand" /t REG_DWORD /d "256" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "MaxOutstandingCmds" /t REG_DWORD /d "256" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "MaxQueuedCommands" /t REG_DWORD /d "256" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "MaxOutstandingIORequests" /t REG_DWORD /d "256" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "NumberOfRequests" /t REG_DWORD /d "1500" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "IoSubmissionQueueCount" /t REG_DWORD /d "3" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "IoQueueDepth" /t REG_DWORD /d "64" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "HostMemoryBufferBytes" /t REG_DWORD /d "1500" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\stornvme\Parameters" /v "ArbitrationBurst" /t REG_DWORD /d "256" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "QueueDepth" /t REG_DWORD /d "64" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "NvmeMaxReadSplit" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "NvmeMaxWriteSplit" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Devicr" /v "MaxSegmentsPerCommand" /t REG_DWORD /d "256" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "MaxOutstandingCmds" /t REG_DWORD /d "256" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "MaxQueuedCommands" /t REG_DWORD /d "256" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "MaxOutstandingIORequests" /t REG_DWORD /d "256" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "NumberOfRequests" /t REG_DWORD /d "1500" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "IoSubmissionQueueCount" /t REG_DWORD /d "3" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "IoQueueDepth" /t REG_DWORD /d "64" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "HostMemoryBufferBytes" /t REG_DWORD /d "1500" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorNVMe\Parameters\Device" /v "ArbitrationBurst" /t REG_DWORD /d "256" /f

rem # Enable HMB (2 = Max / Default)
rem # Host Memory Buffer
reg add "HKLM\SYSTEM\CurrentControlSet\Control\StorPort" /v "HmbAllocationPolicy" /t REG_DWORD /d "2" /f

rem # https://sites.google.com/site/tweakradje/windows/windows-tweaking

rem # Copy Buffer Size
rem # 0x40000/256Kb - 0x2000/8Kb - 0x100000/1Mb
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "CopyBufferSize" /t REG_DWORD /d "0x100000" /f

rem # 32KB blocks
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "CopyFileChunkSize" /t REG_DWORD /d "0x8000" /f

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "CopyFileOverlappedCount" /t REG_DWORD /d "0x20" /f

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "CopyFileBufferedSynchronousIo" /t REG_DWORD /d "0x40" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\I/O System" /v "DisableDiskCounters" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\I/O System" /v "RequireDeviceAccessCheck" /t REG_DWORD /d "0" /f

rem # Offloaded Data Transfer (ODX)
rem # 0 = ODX ENABLED / 1 = ODX DISABLED
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "FilterSupportedFeaturesMode" /t REG_DWORD /d "0" /f

rem # Enable NTFS Log File Upgrade
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisableLfsDowngrade" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsDisableLfsUpgrade" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "NtfsQuotaNotifyRate" /t REG_DWORD /d "0xffffffff" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "ScrubMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "SymlinkLocalToLocalEvaluation" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "SymlinkLocalToRemoteEvaluation" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "SymlinkRemoteToLocalEvaluation" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\FileSystem" /v "SymlinkRemoteToRemoteEvaluation" /t REG_DWORD /d "0" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\I/O System" /v "IoEnableSessionZeroAccessCheck" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\I/O System" /v "IoBlockLegacyFsFilters" /t REG_DWORD /d "1" /f

PAUSE
