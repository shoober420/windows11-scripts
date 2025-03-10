rem # Disable Task Scheduler

net stop Schedule

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Schedule" /v "Start" /t REG_DWORD /d "4" /f

PAUSE
