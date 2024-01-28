rem Disables Themes service
REM Breaks User Theme settings when disabled

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Themes" /v "Start" /t REG_DWORD /d "4" /f

PAUSE
