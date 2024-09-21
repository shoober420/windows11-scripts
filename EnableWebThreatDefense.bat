rem # Enable Web Threat Defense services
reg add "HKLM\SYSTEM\CurrentControlSet\Services\webthreatdefsvc" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\webthreatdefusersvc" /v "Start" /t REG_DWORD /d "2" /f
net start webthreatdefsvc
net start webthreatdefusersvc

PAUSE