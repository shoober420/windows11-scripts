rem # Show Product Key

rem # powershell "(Get-WmiObject -query ‘select * from SoftwareLicensingService’).OA3xOriginalProductKey"

wmic path softwareLicensingService get OA3xOriginalProductKey

PAUSE
