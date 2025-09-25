rem # DNS Tweaks

rem # DNS Cache Service tweaks
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "NegativeCacheTime" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "NegativeSOACacheTime" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "NetFailureCacheTime" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "MaximumUdpPacketSize" /t REG_DWORD /d "0x000004c5" /f

reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "DisableSmartNameResolution" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "MaxNegativeCacheTtl" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "NegativeSOACacheTime" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "QueryIpMatching" /t REG_DWORD /d "1" /f

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" /v "DisableMultihomeDNSRegistration" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" /v "DisableParallelNameResolution" /t REG_DWORD /d "1" /f

rem # Disable DNS dynamic update
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" /v "RegistrationEnabled" /t REG_DWORD /d "0" /f

rem # Prefer link local responses over DNS when received over a network with higher precedence
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" /v "PreferLocalOverLowerBindingDNS" /t REG_DWORD /d "1" /f

rem # Turn off smart protocol reordering
rem # DNS client should prefer responses from link local name resolution protocols on non-domain networks over DNS responses when issuing queries for flat names
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows NT\DNSClient" /v "DisableSmartProtocolReordering" /t REG_DWORD /d "1" /f

rem # DNS Cache - Temporary DNS storage on a device that contains DNS records of already visited domain names
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "ServiceDllUnloadOnStop" /t REG_DWORD /d "1" /f

rem # Enable DNS Query Matching
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "QueryIpMatching" /t REG_DWORD /d "1" /f

rem # Disable Discovery of Designated Resolvers (DDR)
rem # Mechanism for DNS clients to use DNS records to discover a resolver's encrypted DNS configuration
reg add "HKLM\Software\Policies\Microsoft\Windows NT\DNSClient" /v "EnableDdr" /t REG_DWORD /d "0" /f

rem # Force DNS over HTTPS (DoH)
rem # Require DoH = 3 / Allow DoH = 2 / Prohibit DoH = 1
reg add "HKLM\Software\Policies\Microsoft\Windows NT\DNSClient" /v "DoHPolicy" /t REG_DWORD /d "3" /f

rem # Disable Internationalized Domain Name (IDN)
reg add "HKLM\Software\Policies\Microsoft\Windows NT\DNSClient" /v "DisableIdnEncoding" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\Policies\Microsoft\Windows NT\DNSClient" /v "EnableIdnMapping" /t REG_DWORD /d "0" /f

rem # Disable Smart Multi-Homed Name Resolution
rem # https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd197552(v=ws.10)
reg add "HKLM\Software\Policies\Microsoft\Windows NT\DNSClient" /v "DisableSmartNameResolution" /t REG_DWORD /d "1" /f
reg add "HKLM\System\CurrentControlSet\Services\Dnscache\Parameters" /v "DisableParallelAandAAAA" /t REG_DWORD /d "1" /f

rem # Disable Multicast/mDNS repeater
rem # https://f20.be/blog/mdns
reg add "HKLM\System\CurrentControlSet\Services\Dnscache\Parameters" /v "EnableMDNS" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\Policies\Microsoft\Windows NT\DNSClient" /v "EnableMulticast" /t REG_DWORD /d "0" /f

rem # Enable Cloudflare DNS
rem # Disable DNS UDP Fallback
rem # Disable Auto-Upgrade (Dynamic DNS / DDNS)
rem # V3nilla: https://github.com/shoober420/windows11-scripts/issues/11

rem # Enable Cloudflare DNS with malware blocking and DOH
rem # Set primary DNS for Wi-Fi and Ethernet interfaces
netsh interface ip set dns Wi-Fi static 1.1.1.2
netsh interface ip set dns Ethernet static 1.1.1.2
netsh dns add encryption server=1.1.1.2 dohtemplate=https://security.cloudflare-dns.com/dns-query autoupgrade=no udpfallback=no

rem # Add secondary DNS for Wi-Fi and Ethernet interfaces 
netsh interface ip add dns Wi-Fi 1.0.0.2 index=2
netsh interface ip add dns Ethernet 1.0.0.2 index=2
netsh dns add encryption server=1.0.0.2 dohtemplate=https://security.cloudflare-dns.com/dns-query autoupgrade=no udpfallback=no


rem # Enable DNS over HTTPS (DoH)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "EnableAutoDoh" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Dnscache\Parameters" /v "EnableDoh" /t REG_DWORD /d "2" /f
rem netsh dns set global doh=force

PAUSE
