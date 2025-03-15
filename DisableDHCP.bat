rem # Disable DHCP service

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dhcp" /v "Start" /t REG_DWORD /d "4" /f

bcdedit /set dhcp Off

PAUSE