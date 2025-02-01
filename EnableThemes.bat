rem Enables Themes service
REM Breaks User Theme settings when disabled

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Themes" /v "Start" /t REG_DWORD /d "2" /f

net start Themes

PAUSE
