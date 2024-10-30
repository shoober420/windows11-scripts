# Disable bloat NIC protocols and drivers
Disable-NetAdapterBinding -Name * -DisplayName "Client for Microsoft Networks"
Disable-NetAdapterBinding -Name * -DisplayName "File and Printer Sharing for Microsoft Networks"
Disable-NetAdapterQos -Name *
Disable-NetAdapterBinding -Name * -DisplayName "Microsoft Network Adapter Multiplexor Protocol"
Disable-NetAdapterBinding -Name * -DisplayName "Microsoft LLDP Protocol Driver"
Disable-NetAdapterBinding -Name * -ComponentID ms_tcpip6
Disable-NetAdapterBinding -Name * -DisplayName "Link-Layer Topology Discovery Responder"
Disable-NetAdapterBinding -Name * -DisplayName "Link-Layer Topology Discovery Mapper I/O Driver"

cmd /c 'pause'