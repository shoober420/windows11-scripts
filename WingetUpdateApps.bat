rem Update winget apps

rem winget requires "Application Information" service to be running
reg add "HKLM\SYSTEM\CurrentControlSet\Services\Appinfo" /v "Start" /t REG_DWORD /d "2" /f
net start Appinfo

winget upgrade --all --include-unknown

PAUSE
