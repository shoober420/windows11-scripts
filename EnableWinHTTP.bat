rem # Enable WinHTTP Web Proxy Auto-Discovery Service (WinHttpAutoProxySvc)
rem # required for WiFi and wireless internet

PAUSE

reg add "HKLM\SYSTEM\CurrentControlSet\Services\WinHttpAutoProxySvc" /v "Start" /t REG_DWORD /d "2" /f
net start WinHttpAutoProxySvc

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\WinHttp" /v "DisableWpad" /t REG_DWORD /d "0" /f

PAUSE
