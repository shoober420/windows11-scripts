rem # Enable DHCP service

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dhcp" /v "Start" /t REG_DWORD /d "2" /f

sc start dhcp

PAUSE