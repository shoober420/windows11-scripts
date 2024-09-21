rem # Enable System Guard Runtime Monitor Broker

reg add "HKLM\SYSTEM\CurrentControlSet\Services\SgrmBroker" /v "Start" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SgrmAgent" /v "Start" /t REG_DWORD /d "2" /f
net start SgrmBroker
net start SgrmAgent

PAUSE