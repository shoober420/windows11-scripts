rem # Remove Firewall Rules

rem # Windows Firewall is bloat, use router firewall

rem # !!! WARNING !!!

rem # Deletes all firewall rules

rem # !!! WARNING !!!

rem # Deleting all inbound firewall rules may break internet for certain Wi-Fi cards

powershell.exe Remove-NetFirewallRule -All

PAUSE