rem # Disable Web Account Manager (TokenBroker)
net stop TokenBroker
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TokenBroker" /v "Start" /t REG_DWORD /d "4" /f

PAUSE