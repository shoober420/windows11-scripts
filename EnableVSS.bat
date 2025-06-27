rem # Enable Volume Shadow Copy service (VSS)

reg add "HKLM\SYSTEM\CurrentControlSet\Services\CscService" /v "VSS" /t REG_DWORD /d "2" /f
net start VSS

PAUSE