rem # Enable Static IP Connection

rem # Make sure the first 3 parts of the IP address and gateway match

ipconfig

netsh interface ip set address name="Ethernet" static 192.168.1.37 255.255.255.0 192.168.1.1

rem # netsh interface ip set address name="Ethernet" static 192.168.50.37 255.255.255.0 192.168.50.1

PAUSE
