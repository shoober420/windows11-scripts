rem # Enable Windows Connection Manager (Wcmsvc)

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Wcmsvc" /v "Start" /t REG_DWORD /d "2" /f
net start Wcmsvc

PAUSE