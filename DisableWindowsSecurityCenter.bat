rem # Disable Windows Security Center

rem # Recommended to run in SAFE MODE

rem # Requires SetACL.bat to be run first
rem # Gives ownership to reg keys

PAUSE

net stop SecurityHealthService
net stop wscsvc
reg add "HKLM\System\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\wscsvc" /v "Start" /t REG_DWORD /d "4" /f

rem # Requires SetACL.bat to be run first
rem # Gives ownership to reg keys

PAUSE