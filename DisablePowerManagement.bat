rem # Disable Power Management option on all devices

reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e96b-e325-11ce-bfc1-08002be10318}\0000" /v "PnPCapabilities" /t REG_DWORD /d "0x00000118" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e96f-e325-11ce-bfc1-08002be10318}\0000" /v "PnPCapabilities" /t REG_DWORD /d "0x00000118" /f

PAUSE