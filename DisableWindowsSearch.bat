rem # Disable Windows Search (WSearch)
rem # causes system hangs and freezes when enabled
net stop WSearch
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WSearch" /v "Start" /t REG_DWORD /d "4" /f

PAUSE