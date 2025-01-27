rem # Disable Web Account Manager (TokenBroker)

rem # may cause black screens after login

net stop TokenBroker

reg add "HKLM\SYSTEM\CurrentControlSet\Services\TokenBroker" /v "Start" /t REG_DWORD /d "4" /f

PAUSE