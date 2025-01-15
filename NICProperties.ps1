# Disable bloat NIC protocols and drivers

powershell Disable-NetAdapterBinding -Name * -DisplayName 'Client for Microsoft Networks'
powershell Disable-NetAdapterBinding -Name * -DisplayName 'File and Printer Sharing for Microsoft Networks'
powershell Disable-NetAdapterQos -Name *
powershell Disable-NetAdapterBinding -Name * -DisplayName 'Microsoft Network Adapter Multiplexor Protocol'
powershell Disable-NetAdapterBinding -Name * -DisplayName 'Microsoft LLDP Protocol Driver'
powershell Disable-NetAdapterBinding -Name * -ComponentID ms_tcpip6
powershell Disable-NetAdapterBinding -Name * -DisplayName 'Link-Layer Topology Discovery Responder'
powershell Disable-NetAdapterBinding -Name * -DisplayName 'Link-Layer Topology Discovery Mapper I/O Driver'

cmd /c 'pause'