rem # Enable Web Account Manager (TokenBroker)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\TokenBroker" /v "Start" /t REG_DWORD /d "2" /f
net start TokenBroker

PAUSE