rem # Enable CCleaner services
rem # Sets to "Manual", the default value

reg add "HKLM\SYSTEM\CurrentControlSet\Services\CCleanerPerformanceOptimizerService" /v "Start" /t REG_DWORD /d "3" /f

PAUSE
