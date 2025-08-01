# Set DNS servers to Cloudflare 1.1.1.1
# Enable DNS over HTTPS (DoH)
# Disable DNS UDP Fallback
# Disable Auto-Upgrade (Dynamic DNS / DDNS)
# V3nilla: https://github.com/shoober420/windows11-scripts/issues/11

$i = Get-NetAdapter -Physical
$i | Get-DnsClientServerAddress -AddressFamily IPv4 | Set-DnsClientServerAddress -ServerAddresses '1.1.1.1' | Add-DnsClientDohServerAddress -ServerAddress 1.1.1.1 -DohTemplate https://cloudflare-dns.com/dns-query -AutoUpgrade $False -AllowFallbackToUdp $False
$i | ForEach-Object {
$s1 = 'HKLM:System\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\' + $_.InterfaceGuid + '\DohInterfaceSettings\Doh\1.1.1.1'; New-Item -Path $s1 -Force | New-ItemProperty -Name "DohFlags" -Value 1 -PropertyType Qword
# $s2 = 'HKLM:System\CurrentControlSet\Services\Dnscache\InterfaceSpecificParameters\' + $_.InterfaceGuid + '\DohInterfaceSettings\Doh\1.0.0.1'; New-Item -Path $s2 -Force  | New-ItemProperty -Name "DohFlags" -Value 1 -PropertyType Qword
}
Clear-DnsClientCache;

cmd /c 'pause'