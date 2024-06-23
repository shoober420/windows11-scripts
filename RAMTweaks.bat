rem # ADJUST VALUES ACCORDING TO RAM SIZE

rem # Pagefile Size in MB (16GB = 16384) (32GB = 32768) (64GB = 65536)
rem # InitialSize=65536,MaximumSize=65536
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=32768,MaximumSize=32768
rem reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagingFiles" /t REG_MULTI_SZ /d "c:\pagefile.sys 0 0" /f

rem # SvcHostSplitThresholdInKB value is amount of RAM in KiloBytes (KB)
rem # Example math formula: 8 GB = 8x1024 MB = 8x1024x1024 KB = 8388608 KB
rem # 8GB = 8388608 (800000) / 16GB = 16777216 (1000000) / 32GB = 33554432 (2000000) / 64GB = 67108864 (4000000)
reg add "HKLM\SYSTEM\ControlSet001\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "2000000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "2000000" /f

rem # Limits RAM to use certain tasks
rem # Example math formula: 8 GB = 8x1024 MB = 8x1024x1024 KB = 8388608 KB
rem # 8GB = 8388608 (800000) / 16GB = 16777216 (1000000) / 32GB = 33554432 (2000000) / 64GB = 67108864 (4000000)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "IoPageLockLimit" /t REG_DWORD /d "2000000" /f

PAUSE
