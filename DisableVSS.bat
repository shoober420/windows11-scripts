rem # Disable Volume Shadow Copy service (VSS)

net stop VSS
reg add "HKLM\SYSTEM\CurrentControlSet\Services\CscService" /v "VSS" /t REG_DWORD /d "4" /f

PAUSE