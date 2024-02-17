REM Enables essential and requires Windows services

reg add "HKLM\SYSTEM\CurrentControlSet\Services\StateRepository" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SystemEventsBroker" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\BrokerInfrastructure" /v "Start" /t REG_DWORD /d "2" /f

net start StateRepository
net start SystemEventsBroker
net start BrokerInfrastructure

PAUSE
