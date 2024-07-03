rem # Disable CCleaner services

reg add "HKLM\SYSTEM\CurrentControlSet\Services\CCleanerPerformanceOptimizerService" /v "Start" /t REG_DWORD /d "4" /f

PAUSE
