rem # Enable Windows Search (WSearch)
rem # causes system hangs and freezes when enabled
reg add "HKLM\SYSTEM\CurrentControlSet\Services\WSearch" /v "Start" /t REG_DWORD /d "2" /f
net start WSearch

PAUSE