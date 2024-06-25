rem !!! WARNING !!!
rem # ADJUST VALUES ACCORDING TO RAM SIZE

msg "ADJUST SCRIPT SETTINGS TO CORRESPOND WITH YOUR HARDWARE BEFORE RUNNING"
PAUSE

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

rem # Trim your massive WorkingSet
rem # https://www.tenforums.com/performance-maintenance/189717-test-trim-workingset-ram.html
rem # https://www.i.u-tokyo.ac.jp/edu/training/ss/lecture/new-documents/Lectures/15-CacheManager/CacheManager.pdf
rem # CacheUnmapBehindLengthInMB=dword:00000100 ;256MB = 4GB RAM / 512MB = 8GB RAM / 1024MB = 16GB RAM / 2048MB = 32GB RAM / 4096MB = 64GB RAM
rem # dword:00000100 = 256MB = 4GB RAM / dword:00000200 = 512MB = 8GB RAM / dword:00000300 = 768MB = 12GB RAM / dword:00000400 = 1024MB = 16GB RAM / dword:00000800 = 2048MB = 32GB RAM / dword:00001600 = 4096MB = 64GB RAM 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "CacheUnmapBehindLengthInMB" /t REG_DWORD /d "0x00000800" /f

rem # ModifiedWriteMaximum=dword:00000020 ;32MB = 4GB RAM / 64MB = 8GB RAM / 128MB = 16GB RAM / 256MB = 32GB RAM / 512MB = 64GB RAM
rem # dword:00000020 ;32MB = 4GB RAM / dword:00000040 ;64MB = 8GB RAM / dword:00000060 ;96MB = 12GB RAM / dword:00000080 ;128MB = 16GB RAM / dword:00000160 ;256MB = 32GB RAM / dword:00000320 ;512MB = 64GB RAM
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ModifiedWriteMaximum" /t REG_DWORD /d "0x00000160" /f

PAUSE
