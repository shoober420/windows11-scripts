rem # Delete Windows Backups
rem # Removes System Restore and Shadow Copies

rem # Requires Volume Shadow Copy service
reg add "HKLM\SYSTEM\CurrentControlSet\Services\CscService" /v "VSS" /t REG_DWORD /d "2" /f
net start VSS

vssadmin delete shadows /for=c: /all

PAUSE