rem # Maximum Transmission Unit (MTU)
rem # Auto-configs MTU size for network and applies value

rem # Make sure "subinterface" matches network name
rem # Find correct MTU value and set below
rem # open Command Prompt
rem # ping www.google.com -f -l 1500 (keep lowering value until packets aren't fragmented)

netsh interface ipv4 set subinterface "Wi-Fi" mtu=1472 store=persistent
netsh interface ipv4 set subinterface "Ethernet" mtu=1472 store=persistent