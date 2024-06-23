REM Always Show Taskbar
REM Disables AutoHide Taskbar
powershell -command "&{$p= 'HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\StuckRects3' ;$v=(Get-ItemProperty -Path $p).Settings;$v[8]=2;&Set-ItemProperty -Path $p -Name Settings -Value $v;&Stop-Process -f -ProcessName explorer}"
