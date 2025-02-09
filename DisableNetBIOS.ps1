# Disable NETBIOS and WINS

# https://notes.ponderworthy.com/major-performance-boost-disable-netbios-on-all-windows-nics

# Turn off NETBIOS over TCP/IP, for each NIC
Get-CimInstance -ClassName 'Win32_NetworkAdapterConfiguration' | Invoke-CimMethod -MethodName 'SetTcpipNetbios' -Arguments @{ 'TcpipNetbiosOptions' = [UInt32](2) }

# Get rid of all WINS entries, if present
Get-WmiObject Win32_NetworkAdapterConfiguration | Invoke-WmiMethod -Name SetWINSServer -ArgumentList @('','')

# Disable LMHOSTS lookups
$nicall = [wmiclass]'Win32_NetworkAdapterConfiguration'
$nicall.enablewins($false,$false)

# Disable TCP/IP NetBIOS Helper (lmhosts)
Set-Service -Name "lmhosts" -StartupType Disabled
Stop-Service -Name "lmhosts"

cmd /k 'pause'
