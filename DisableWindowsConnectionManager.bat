rem # Disable Windows Connection Manager (Wcmsvc)

net stop Wcmsvc
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Wcmsvc" /v "Start" /t REG_DWORD /d "4" /f

PAUSE