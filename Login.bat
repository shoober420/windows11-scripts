rem # Login settings

rem # 0 = Allow users to add accounts / 1 = Blocks users from adding accounts / 3 = Blocks users from adding accounts and signing into accounts
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "NoConnectedUser" /t REG_DWORD /d "3" /f

PAUSE
