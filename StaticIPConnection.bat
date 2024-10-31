rem # Enable Static IP Connection
netsh interface ip set address name="Ethernet" static 192.168.50.73 255.255.255.0 192.168.50.1
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dhcp" /v "Start" /t REG_DWORD /d "4" /f

PAUSE
