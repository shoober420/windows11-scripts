rem # Disable AMD CPU Services (bloat)

net stop amdfendr
net stop amdfendrmgr
net stop "AMD Crash Defender Service"
net stop AMDXE
net stop amdpsp
net stop AMDSAFD
net stop AUEPLauncher
net stop amdlog

reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdfendr" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdfendrmgr" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AMD Crash Defender Service" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AMDXE" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdpsp" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AMDSAFD" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\AUEPLauncher" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\amdlog" /v "Start" /t REG_DWORD /d "4" /f



rem # Disable AMD External Events Utility
rem # V3nilla
rem # https://github.com/shoober420/windows11-scripts/issues/14

rem # !!! WARNING !!!

rem # Locks FPS to monitor refresh rate for some games

rem # !!! WARNING !!!

rem reg add "HKLM\SYSTEM\CurrentControlSet\Services\AMD External Events Utility" /v "Start" /t REG_DWORD /d "4" /f

PAUSE