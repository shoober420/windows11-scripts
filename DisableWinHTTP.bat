rem # Disable WinHTTP Web Proxy Auto-Discovery Service (WinHttpAutoProxySvc)
rem # Breaks WiFi and wireless internet when disabled

PAUSE

net stop WinHttpAutoProxySvc

reg add "HKLM\SYSTEM\CurrentControlSet\Services\WinHttpAutoProxySvc" /v "Start" /t REG_DWORD /d "4" /f

reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\WinHttp" /v "DisableWpad" /t REG_DWORD /d "1" /f

PAUSE
