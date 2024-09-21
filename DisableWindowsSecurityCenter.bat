rem # Disable Windows Security Center
rem # requires SAFE MODE
rem # must run SetACL.bat first

PAUSE

net stop SecurityHealthService
net stop wscsvc
reg add "HKLM\System\CurrentControlSet\Services\SecurityHealthService" /v "Start" /t REG_DWORD /d "4" /f
reg add "HKLM\System\CurrentControlSet\Services\wscsvc" /v "Start" /t REG_DWORD /d "4" /f

PAUSE