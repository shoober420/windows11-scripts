# Set DNS servers to Cloudflare 1.1.1.1
# Enable DNS over HTTPS (DoH)
# Disable DNS UDP Fallback
# Disable Auto-Upgrade (Dynamic DNS / DDNS)
# V3nilla: https://github.com/shoober420/windows11-scripts/issues/11

# --- Configuration ---
$PrimaryDns   = '1.1.1.2'
$SecondaryDns = '1.0.0.2'
$DohTemplate  = 'https://security.cloudflare-dns.com/dns-query'

function Ensure-DohServer {
    param (
        [string]$ServerAddress,
        [string]$Template
    )
    # Check if the DoH server is already registered system-wide
    $existing = Get-DnsClientDohServerAddress -ErrorAction SilentlyContinue |
                Where-Object { $_.ServerAddress -eq $ServerAddress }

    if (-not $existing) {
        try {
            # Register the new DoH server
            Add-DnsClientDohServerAddress -ServerAddress $ServerAddress `
                -DohTemplate $Template -AllowFallbackToUdp $false -ErrorAction Stop
            Write-Host " -> Registered DoH server $ServerAddress." -ForegroundColor Green
        }
        catch {
            Write-Error "Failed to add DoH server $ServerAddress. Error: $($_.Exception.Message)"
        }
    }
    else {
        Write-Host " -> DoH server $ServerAddress already registered." -ForegroundColor Yellow
    }
}

Write-Host "Configuring Cloudflare Malware-Blocking DNS with DoH..." -ForegroundColor Cyan

# 1. Register DoH servers for the system
Ensure-DohServer -ServerAddress $PrimaryDns   -Template $DohTemplate
Ensure-DohServer -ServerAddress $SecondaryDns -Template $DohTemplate

# 2. Find all network adapters that are both physical and currently connected
$activeAdapters = Get-NetAdapter -Physical | Where-Object { $_.Status -eq 'Up' }
if (-not $activeAdapters) {
    Write-Warning "No active physical network adapters found to configure."
    Read-Host "Press Enter to exit."
    return # Exit the script
}

Write-Host "`nFound $($activeAdapters.Count) active adapter(s). Applying settings..."

# 3. Configure each active adapter
foreach ($adapter in $activeAdapters) {
    Write-Host " - Configuring '$($adapter.Name)'..."
    try {
        Set-DnsClientServerAddress -InterfaceIndex $adapter.InterfaceIndex `
            -ServerAddresses @($PrimaryDns, $SecondaryDns) -ErrorAction Stop
        Set-DnsClientInterface -InterfaceIndex $adapter.InterfaceIndex `
            -DnsEncryption 'Require' -ErrorAction Stop
        Write-Host "   Successfully applied to '$($adapter.Name)'." -ForegroundColor Green
    }
    catch {
        Write-Error "Failed on '$($adapter.Name)': $($_.Exception.Message)"
    }
}

Write-Host "`nClearing DNS cache..."
Clear-DnsClientCache

Write-Host "`nConfiguration complete." -ForegroundColor Cyan
Read-Host "Press Enter to close this window."
